import "dart:io";
import "package:burt_network/burt_network.dart";

final destination = SocketInfo(
  // Replace this with a real IP address for testing
  // address: InternetAddress("192.168.1.10"),
	address: InternetAddress.loopbackIPv4,
	port: 8001,
);

void main() async {
  final client = RoverSocket(port: 8000, destination: destination, device: Device.DASHBOARD);
  client.stream.listen((packet) {
    final wrapper = WrappedMessage.fromBuffer(packet.data);
    client.logger.info("Received ${wrapper.name} message: ${wrapper.data}");
  });

	await client.init();
  client.destination = destination;
	final message = ScienceData(temperature: 1, co2: 2);
  while (true) {
    client.sendMessage(message);
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
