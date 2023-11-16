import "dart:io";
import "package:burt_network/burt_network.dart";

class TestServer extends UdpSocket {
  TestServer() : super(port: 8001);
  
  @override
  void onData(Datagram packet) => print(packet.data);
}

void main() async {
  final server = TestServer();
  await server.init();
}
