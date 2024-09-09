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

abstract class BurtSocket extends UdpSocket {
  final _controller = StreamController<WrappedMessage>.broadcast();
  final Device? device;

  Timer? _heartbeatTimer;
  StreamSubscription<Datagram?>? _subscription;
  Service? collection;

  BurtSocket({
    required super.port,
    super.destination,
    super.quiet,
    this.device,
    this.collection,
  });

  Stream<WrappedMessage> get messages => _controller.stream;

  void sendWrapper(WrappedMessage wrapper) => send(wrapper.writeToBuffer());
  void sendMessage(Message message, {SocketInfo? destination}) => sendWrapper(message.wrap());

  @override
  Future<bool> init() async {
    await super.init();
    _subscription = stream.listen(_onPacket);
    _heartbeatTimer = Timer.periodic(heartbeatInterval, (_) => checkHeartbeats());
    return true;
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    _heartbeatTimer?.cancel();
    await super.dispose();
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
    destination = source;
    logger.info("Port $port is connected to $source");
  }

  /// Sends a [Disconnect] message to the dashboard and sets [destination] to `null`.
  ///
  /// Override this function to run custom code when the device on the other end disconnects.
  /// For example, put code to stop the rover from driving in here when connection is lost.
  @override
  Future<void> onDisconnect() async {
    logger.info("Port $port is disconnected from $destination");
    sendMessage(Disconnect(sender: device));
    destination = null;
    await collection?.onDisconnect();
    await super.onDisconnect();
  }
}
