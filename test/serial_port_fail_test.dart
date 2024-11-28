import "dart:typed_data";
import "package:test/test.dart";

import "package:burt_network/burt_network.dart";

import "failing_port.dart";

const readInterval = Duration(milliseconds: 100);

void main() async {
  Logger.level = LogLevel.off;
  final logger = BurtLogger();
  final port = FailingSerialPort("portName");
  final device = SerialDevice.fromPort(port, logger: logger, readInterval: readInterval);

  group("Failing Serial port", () {
    setUp(device.init);
    tearDown(device.dispose);

    test("can safely restart", () async {
      await device.dispose();
      await device.init();
    });

    test("reports errors when opening", () async {
      await device.dispose();
      final result = await device.init();
      expect(result, isFalse);
    });

    test("handles errors when listening", () async {
      device.startListening();
      const listenDelay = Duration(seconds: 1);
      await Future<void>.delayed(listenDelay);
      device.stopListening();
    });

    test("handles errors when reading", () {
      final bytes1 = device.readBytes();
      expect(bytes1, isEmpty);
      final bytes2 = device.readBytes(10);
      expect(bytes2, isEmpty);
    });

    test("handles errors when writing", () {
      const data = [1, 2, 3, 4, 5, 6, 7, 8];
      final buffer = Uint8List.fromList(data);
      device.write(buffer);
    });
  });

  test("Device can handle being suddenly disconnected: read()", () async {
    final port = DisconnectedSerialPort("portName");
    final device = SerialDevice.fromPort(port, readInterval: readInterval, logger: logger);
    await device.init();
    expect(device.isOpen, true);
    expect(device.readBytes(), Uint8List.fromList([1, 2, 3, 4]));
    expect(device.isOpen, false);
    expect(device.readBytes().isEmpty, true);
  });

  test("Device can handle being suddenly disconnected: stream", () async {
    final port = DisconnectedSerialPort("portName");
    final device = SerialDevice.fromPort(port, readInterval: readInterval, logger: logger);
    final sub = device.stream.listen((_) { });
    await device.init();
    expect(device.isOpen, true);
    device.startListening();
    await Future<void>.delayed(const Duration(seconds: 1));
    expect(device.isOpen, false);
    await device.closeStream();
    await device.dispose();
    await sub.cancel();
  });

  test("Failing device does not try to call dispose", () async {
    final port = DisconnectedSerialPort("portName");
    final device = SerialDevice.fromPort(port, readInterval: readInterval, logger: logger);
    final sub = device.stream.listen((_) { });
    await device.init();
    expect(device.isOpen, true);
    device.startListening();
    await Future<void>.delayed(const Duration(seconds: 1));
    expect(device.isOpen, false);
    await device.closeStream();
    await device.dispose();
    await sub.cancel();
  });
}
