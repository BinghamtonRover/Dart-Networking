import "dart:io";
import "package:burt_network/burt_network.dart";
import "package:test/test.dart";

final logger = BurtLogger();
const heartbeatDelay = Duration(milliseconds: 100);

SocketInfo withPort(int port) => SocketInfo(address: InternetAddress.loopbackIPv4, port: port);

void main() => group("ProtoSocket:", () {
  Logger.level = LogLevel.off;

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

  // tearDownAll(() async {
  //   await server.dispose();
  //   await client.dispose();
  // });
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
    stream.onMessage(
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
  void onDisconnect() {
    super.onDisconnect();
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
