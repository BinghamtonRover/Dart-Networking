import "dart:io";
import "package:burt_network/burt_network.dart";
import "package:test/test.dart";

final logger = BurtLogger();
const heartbeatDelay = Duration(milliseconds: 100);

SocketInfo withPort(int port) => SocketInfo(address: InternetAddress.loopbackIPv4, port: port);

void main() => group("ProtoSocket:", () {
  Logger.level = LogLevel.off;

  test("Socket can be safely reset", () async {
    final socket = RoverSocket(port: 8000, device: Device.SUBSYSTEMS);
    await socket.init();
    await socket.dispose();
    await socket.init();
  });

  test("Heartbeats received by both client and server", () async {
    final server = TestServer(port: 8001);
    final client = TestClient(port: 8002, destination: withPort(8001));
    await server.init();
    await client.init();
    await Future<void>.delayed(heartbeatDelay);
    expect(server.isConnected, isTrue);
    expect(client.isConnected, isTrue);
    await server.dispose();
    await client.dispose();
  });

  test("onConnect and onDisconnect are called", () async {
    final server = TestServer(port: 8003);
    final client = TestClient(port: 8004, destination: withPort(8003));
    await server.init();
    await client.init();
    client.shouldSendHeartbeats = true;
    await Future<void>.delayed(heartbeatDelay);
    expect(server.onConnectCalled, isTrue);
    client.shouldSendHeartbeats = false;
    await Future<void>.delayed(heartbeatDelay);
    expect(server.onDisconnectCalled, isTrue);
    await server.dispose();
    await client.dispose();
  });

  test("Data makes it across", () async {
    final data = ScienceData(co2: 3);
    final server = TestServer(port: 8005);
    final client = TestClient(port: 8006, destination: withPort(8005));
    await server.init();
    await client.init();
    client.sendMessage(data);
    await Future<void>.delayed(heartbeatDelay);
    expect(server.data, equals(data));
    await server.dispose();
    await client.dispose();
  });

  test("Data arrives after a socket is reset", () async {
    var data = ScienceData();
    final data1 = ScienceData(co2: 1);
    final data2 = ScienceData(co2: 2);
    final server = TestServer(port: 8005);
    final client = TestClient(port: 8006, destination: withPort(8005));
    // Initialize both sockets
    await server.init();
    await client.init();
    server.messages.onMessage(
      name: ScienceData().messageName,
      constructor: ScienceData.fromBuffer,
      callback: (d) => data = d,
    );
    // Send the first packet
    client.sendMessage(data1);
    await Future<void>.delayed(heartbeatDelay);
    expect(data, equals(data1));
    expect(server.data, equals(data1));
    // Reset the server
    await server.dispose();
    await server.init();
    await Future<void>.delayed(heartbeatDelay);
    // Send the second packet
    client.sendMessage(data2);
    await Future<void>.delayed(heartbeatDelay);
    expect(data, equals(data2));
    expect(server.data, equals(data2));
    await server.dispose();
    await client.dispose();
  });
});

class TestServer extends RoverSocket {
  ScienceData? data;
  bool onConnectCalled = false;
  bool onDisconnectCalled = false;

  TestServer({required super.port}) : super(device: Device.SUBSYSTEMS);

  @override
  Duration get heartbeatInterval => const Duration(milliseconds: 20);

  @override
  Future<void> shutdown() async { }

  @override
  Future<void> restart() async { }

  @override
  Future<bool> init() async {
    await super.init();
    messages.onMessage(
      name: ScienceData().messageName,
      constructor: ScienceData.fromBuffer,
      callback: (x) => data = x,
    );
    return true;
  }

  @override
  void onConnect(SocketInfo info) {
    super.onConnect(info);
    onConnectCalled = true;
  }

  @override
  Future<void> onDisconnect() async {
    await super.onDisconnect();
    onDisconnectCalled = true;
  }
}

class TestClient extends BurtSocket {
  @override
  Duration get heartbeatInterval => const Duration(milliseconds: 10);

  TestClient({required super.port, super.destination}) : super(device: Device.DASHBOARD);

  @override
  bool isConnected = false;
  bool shouldSendHeartbeats = true;

  @override
  Future<void> checkHeartbeats() async {
    if (!shouldSendHeartbeats) return;
    final heartbeat = Connect(sender: Device.DASHBOARD, receiver: Device.SUBSYSTEMS);
    sendMessage(heartbeat);
  }

  @override
  void onHeartbeat(Connect heartbeat, SocketInfo source) {
    logger.debug("$port received a heartbeat from ${source.port}");
    isConnected = true;
  }

  @override
  void onSettings(UpdateSetting settings) { }
}
