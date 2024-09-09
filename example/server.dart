import "package:burt_network/burt_network.dart";

final logger = BurtLogger();

void onData(ScienceData data) =>
  logger.info("Received ScienceData message: ${data.toProto3Json()}");

void main() async {
  // Registers as the Subsystems Server on the Dashboard
	final server = RoverSocket(port: 8001, device: Device.SUBSYSTEMS);
  final sub = server.stream.onMessage(
    name: ScienceData().messageName,
    constructor: ScienceData.fromBuffer,
    callback: onData,
  );
  await sub.cancel();
	await server.init();
}
