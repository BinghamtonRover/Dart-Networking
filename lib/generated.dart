export "src/generated/arm.pb.dart";
export "src/generated/autonomy.pb.dart";
export "src/generated/core.pb.dart";
export "src/generated/drive.pb.dart";
export "src/generated/electrical.pb.dart";
export "src/generated/gps.pb.dart";
export "src/generated/mars.pb.dart";
export "src/generated/science.pb.dart";
export "src/generated/video.pb.dart";
export "src/generated/wrapper.pb.dart";
export "src/generated/google/protobuf/timestamp.pb.dart";

import "package:protobuf/protobuf.dart" as proto;

import "src/generated/wrapper.pb.dart";
import "src/generated/google/protobuf/timestamp.pb.dart";

/// A cleaner name for any message generated by Protobuf.
typedef Message = proto.GeneratedMessage;

/// Defines a friendlier method for getting the name of a message.
extension MessageUtils on Message {
  /// The name of the message as declared in the .proto file. 
  String get messageName => info_.messageName;

  /// Returns a [WrappedMessage] representing this message with a timestamp
  WrappedMessage wrap([DateTime? timestamp]) => WrappedMessage(
    data: writeToBuffer(),
    name: messageName,
    timestamp: Timestamp.fromDateTime(timestamp ?? DateTime.now()),
  );
}