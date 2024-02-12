import "dart:typed_data";

import "package:meta/meta.dart";

abstract class SerialDeviceInterface {
  String get port;
  bool get isOpen;
  Stream<Uint8List> get stream;

  @mustCallSuper
  Future<void> open();

  @mustCallSuper
  Future<void> dispose();

  Uint8List read({int? count});
  void write(List<int> bytes);
  void startListening();
  void stopListening();
}
