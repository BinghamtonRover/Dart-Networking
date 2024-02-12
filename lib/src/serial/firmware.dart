import "dart:async";
import "dart:typed_data";

import "package:burt_network/generated.dart";
import "package:protobuf/protobuf.dart";

import "device.dart";

String getDeviceDataName(Device? device) => switch (device) {
  Device.ARM => ArmData().messageName,
  Device.GRIPPER => GripperData().messageName,
  Device.SCIENCE => ScienceData().messageName,
  Device.DRIVE => DriveData().messageName,
  Device.FIRMWARE => throw StateError("Device not identified when receiving packet"),
  null => throw StateError("Null device when receiving packet"),
  _ => throw ArgumentError("Unrecognized device: $device"),
};

class BurtFirmware {
  final SerialDeviceInterface _serial;
  final Device _sender;
  BurtFirmware(this._serial, this._sender);

  StreamSubscription<Uint8List>? _subscription;
  final _controller = StreamController<WrappedMessage>();

  Device? device = Device.FIRMWARE;
  bool get isConnected => device == null;
  
  Future<bool> connect() async {
    await _serial.open();
    await disconnect();
    if (!await sendHandshake()) return false;
    _serial.startListening();
    _subscription = _serial.stream.listen(
      (data) => _controller.add(
        WrappedMessage(
          name: getDeviceDataName(device),
          data: data,
        ),
      ),
    );
    return true;
  }

  /// Sends the reset code and returns whether a valid response was received.
  Future<bool> disconnect() async { 
    const resetCode = [0, 0, 0, 0];
    const resetDelay = Duration(milliseconds: 200);
    _serial.write(resetCode);
    await Future<void>.delayed(resetDelay);
    final response = _serial.read(count: 4);
    if (response.isEmpty) return false;
    if (response.length != 4) return false;
    if (response.any((x) => x != 1)) return false;
    device = null;
    await _subscription?.cancel();
    return true;
  }

  /// Sends a handshake and returns whether the firmware identified itself properly.
  Future<bool> sendHandshake() async {
    const handshakeDelay = Duration(milliseconds: 200);
    final handshake = Connect(sender: _sender, receiver: Device.FIRMWARE);
    _serial.write(handshake.writeToBuffer());
    await Future<void>.delayed(handshakeDelay);
    final response = _serial.read(count: 4);
    if (response.isEmpty) return false;
    final Connect message;
    try {
      message = Connect.fromBuffer(response);
    } on InvalidProtocolBufferException {
      return false;
    }
    if (message.receiver != _sender) return false;
    device = message.sender;
    return true;
  }

  Future<void> dispose() async {
    await disconnect();
    _serial.stopListening();
    await _subscription?.cancel();
    await _controller.close();
    await _serial.dispose();
  }

  Stream<WrappedMessage> get messages => _controller.stream;
  void sendMessage(Message message) => _serial.write(message.writeToBuffer());
}
