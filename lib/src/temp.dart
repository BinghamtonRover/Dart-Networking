// // ignore_for_file: public_member_api_docs

// import "dart:async";
// import "dart:io";

// import "package:burt_network/generated.dart";
// import "package:burt_network/logging.dart";
// import "package:meta/meta.dart";

// import "socket_info.dart";

// abstract class UdpSocket {
//   final logger = BurtLogger();
//   late final int? port;
//   late SocketInfo? destination;

//   Future<void> init() async { }
//   Future<void> dispose() async { }

//   void sendData(List<int> data, {SocketInfo? destinationOverride}) { }
//   void onData(Datagram packet);
// }

// abstract class ProtoSocket extends UdpSocket {
//   late final Device device;

//   @override
//   void onData(Datagram packet) {
//     final wrapper = WrappedMessage.fromBuffer(packet.data);
//     final source = SocketInfo(address: packet.address, port: packet.port);
//     onWrapper(wrapper, source);
//   }

//   void sendWrapper(WrappedMessage wrapper, {SocketInfo? destinationOverride}) { }
//   void sendMessage(Message message, {SocketInfo? destinationOverride}) { }
//   void onWrapper(WrappedMessage wrapper, SocketInfo source);
// }

// // Can be used on both dashboard and rover
// abstract class RoverUdpProtocol extends ProtoSocket {
//   bool get isConnected;
  
//   @override
//   @mustCallSuper
//   void onWrapper(WrappedMessage wrapper, SocketInfo source) {
//     if (wrapper.name == Connect().messageName) {
//       final heartbeat = Connect.fromBuffer(wrapper.data);
//       onHeartbeat(heartbeat, source);
//     } else {
//       onMessage(wrapper);
//     }
//   }

//   void onHeartbeat(Connect heartbeat, SocketInfo source);
//   void checkHeartbeats();
//   void onMessage(WrappedMessage message);
// }

// mixin RoverHeartbeats on RoverUdpProtocol {
//   /// A timer to call [checkHeartbeats] every [heartbeatInterval].
//   late Timer heartbeatTimer;

//   /// How often to check for heartbeats.
//   late final Duration heartbeatInterval;

//   /// Whether this socket received a heartbeat since the last call to [checkHeartbeats].
//   bool didReceivedHeartbeat = false;

//   @override
//   bool get isConnected => destination != null;


//   /// Handles incoming heartbeats.
//   /// 
//   /// 1. If the heartbeat was meant for another device, log it and ignore it.
//   /// 2. If it came from our dashboard, respond to it with [sendHeartbeatResponse].
//   /// 3. If it came from another dashboard, log it and ignore it.
//   /// 4. If we are not connected to any dashboard, call [onConnect] and respond to it.
//   @override
//   void onHeartbeat(Connect heartbeat, SocketInfo source) {
//     if (heartbeat.receiver != device) {  // (1)
//       logger.warning("Received a misaddressed heartbeat for ${heartbeat.receiver}");
//     } else if (isConnected) {
//       if (destination == source) {  // (2)
//         sendHeartbeatResponse();
//       } else {  // (3)
//         logger.warning("Port $port is connected to $destination but received a heartbeat from $source");
//       }
//     } else {  // (4)
//       onConnect(source);
//       sendHeartbeatResponse();
//     }
//   }

//   /// Checks if a heartbeat has been received. If not, calls [onDisconnect].
//   /// 
//   /// This function runs every [heartbeatInterval] seconds via [heartbeatTimer].
//   @override
//   Future<void> checkHeartbeats() async {
//     if (didReceivedHeartbeat) {
//       didReceivedHeartbeat = false;
//     } else if (isConnected) {
//       logger.warning("Heartbeat not received. Assuming the dashboard has disconnected");
//       onDisconnect();
//     }
//   }

//   void sendHeartbeatResponse() { }
//   @mustCallSuper
//   void onConnect(SocketInfo source) { destination = source; }
//   @mustCallSuper
//   void onDisconnect() { destination = null; }
// }

// mixin RoverLogger on ProtoSocket {
//   /// A list of important logs that need to be sent when the dashboard connects.
//   final List<BurtLog> _logBuffer = [];

//   /// Whether this socket is connected to the dashboard.
//   bool get isConnected;

//   /// Sends all the logs in [_logBuffer].
//   Future<void> flushLogBuffer() async {
//     final temp = List<BurtLog>.from(_logBuffer);
//     if (temp.isEmpty) return;
//     for (final log in temp) {
//       await Future<void>.delayed(const Duration(milliseconds: 100));
//       sendMessage(log);
//     }
//     _logBuffer.clear();
//   } 

//   /// Sends a log message or saves it until a Dashboard is connected.
//   /// 
//   /// Use this for logs that need to make it to the Dashboard, such as errors or warnings.
//   void sendLog(BurtLog log) {
//     if (isConnected) {
//       sendMessage(log);
//     } else {
//       _logBuffer.add(log);
//     }
//   }
// }

// abstract class RoverServer extends RoverUdpProtocol with RoverHeartbeats, RoverLogger {
//   @override
//   void onWrapper(WrappedMessage wrapper, SocketInfo source) {
//     if (wrapper.name == UpdateSetting().messageName) {
//       final settings = UpdateSetting.fromBuffer(wrapper.data);
//       updateSettings(settings);
//     }
//     super.onWrapper(wrapper, source);
//   }

//   @mustCallSuper
//   void updateSettings(UpdateSetting settings) { /* shutdown */ }
//   void restart();
// }

// class SubsystemsServer extends RoverServer {
//   @override
//   void onMessage(WrappedMessage message) { }

//   @override
//   void restart() { }
// }

// class TestServer extends ProtoSocket {
//   @override
//   void onWrapper(WrappedMessage wrapper, SocketInfo source) { }
// }

// class UdpTester extends UdpSocket {
//   @override 
//   void onData(Datagram packet) { }
// }

// class Dashboard extends RoverUdpProtocol {
// 	@override Future<void> checkHeartbeats() async { }
// 	@override void onHeartbeat(Connect heartbeat, SocketInfo source) { }
// 	@override bool get isConnected => true;
// 	@override void onMessage(WrappedMessage wrapper) { }
// }
