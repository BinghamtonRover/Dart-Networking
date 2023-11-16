import "dart:io";

import "package:burt_network/burt_network.dart";

class TestServer extends UdpSocket {
  TestServer() : super(port: 8000);
  
  @override
  void onData(Datagram packet) => print(packet.data);
}

void main() async {
  final client = TestServer();
  await client.init();
  while (true) {
    client.sendData(
      [1, 2, 3, 4], 
      SocketInfo(address: InternetAddress.loopbackIPv4, port: 8001),
      // SocketInfo(address: InternetAddress("128.226.118.34"), port: 8001),
    );
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}