import "dart:async";
import "dart:io";

import "package:burt_network/burt_network.dart";
import "package:meta/meta.dart";

extension WrappedMessageStream on Stream<WrappedMessage> {
  StreamSubscription<T> onMessage<T extends Message>({
    required String name,
    required T Function(List<int>) constructor,
    required void Function(T) callback,
  }) =>
    where((wrapper) => wrapper.name == name)
    .map((wrapper) => constructor(wrapper.data))
    .listen(callback);
}

extension on Datagram {
  WrappedMessage parseWrapper() => WrappedMessage.fromBuffer(data);
  SocketInfo get source => SocketInfo(address: address, port: port);
}

abstract class BurtSocket extends Service {
  final UdpSocket _socket;
  final _controller = StreamController<WrappedMessage>.broadcast();
  final Device? device;
  final int? port;

  Timer? _heartbeatTimer;
  StreamSubscription<Datagram?>? _subscription;
  Service? collection;

  BurtSocket({
    required this.port,
    this.device,
    this.collection,
    bool quiet = false,
    SocketInfo? destination,
  }) : _socket = UdpSocket(
    port: port,
    destination: destination,
    quiet: quiet,
  );

  SocketInfo? get destination => _socket.destination;
  BurtLogger get logger => _socket.logger;
  Stream<WrappedMessage> get stream => _controller.stream;

  void sendWrapper(WrappedMessage wrapper) => _socket.send(wrapper.writeToBuffer());
  void sendMessage(Message message) => sendWrapper(message.wrap());
  set destination(SocketInfo? value) => _socket.destination = value;

  @override
  Future<bool> init() async {
    await _socket.init();
    _subscription = _socket.stream.listen(_onPacket);
    _heartbeatTimer = Timer.periodic(heartbeatInterval, (_) => checkHeartbeats());
    return true;
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    await _socket.dispose();
    _heartbeatTimer?.cancel();
  }

  void _onPacket(Datagram packet) {
    final wrapper = packet.parseWrapper();
    if (wrapper.name == Connect().messageName) {
      final heartbeat = Connect.fromBuffer(wrapper.data);
      onHeartbeat(heartbeat, packet.source);
    } else if (wrapper.name == UpdateSetting().messageName) {
      final settings = UpdateSetting.fromBuffer(wrapper.data);
      onSettings(settings);
    } else {
      _controller.add(wrapper);
    }
  }

  Duration get heartbeatInterval;
  bool get isConnected;
  void checkHeartbeats();
  void onHeartbeat(Connect heartbeat, SocketInfo source);
  void onSettings(UpdateSetting settings);

  /// Sets [destination] to the incoming [source].
  ///
  /// Override this function to run custom code when a device connects to this socket.
  @mustCallSuper
  void onConnect(SocketInfo source) {
    _socket.destination = source;
    logger.info("Port ${_socket.port} is connected to $source");
  }

  /// Sends a [Disconnect] message to the dashboard and sets [destination] to `null`.
  ///
  /// Override this function to run custom code when the device on the other end disconnects.
  /// For example, put code to stop the rover from driving in here when connection is lost.
  @mustCallSuper
  void onDisconnect() {
    logger.info("Port ${_socket.port} is disconnected from ${_socket.destination}");
    sendMessage(Disconnect(sender: device));
    _socket.destination = null;
  }
}
