import "dart:async";
import "dart:math";

import "package:burt_network/generated.dart";

/// JSON data as a map.
typedef Json = Map<String, dynamic>;

/// Helpful methods on [Stream]s of [WrappedMessage]s.
extension WrappedMessageStream on Stream<WrappedMessage> {
  /// Allows callers to listen only for specific messages.
  ///
  /// To use this, pass the name of the message, a function to create the message
  /// from binary data, and a callback to handle the message. For example,
  /// ```dart
  /// collection.server.messages.onMessage(
  ///   name: ScienceData().messageName,  // equals "ScienceData"
  ///   constructor: ScienceData.fromBuffer,
  ///   callback: (data) => print(data.co2);
  /// )
  /// ```
  ///
  /// This function returns a [StreamSubscription] that you can use to stop listening.
  StreamSubscription<T> onMessage<T extends Message>({
    required String name,
    required T Function(List<int>) constructor,
    required void Function(T) callback,
  }) =>
    where((wrapper) => wrapper.name == name)
    .map((wrapper) => constructor(wrapper.data))
    .listen(callback);
}

/// Helpful methods on streams of nullable values.
extension NullableStreamUtils<T> on Stream<T?> {
  /// Transforms a stream of type `T?` to type `T` by filtering out nulls.
  Stream<T> notNull() => where((x) => x != null).cast<T>();
}

/// Returns the type of data message that would be emitted by this device.
String? deviceToDataName(Device device) => switch (device) {
  Device.ARM => ArmData().messageName,
  Device.DRIVE => DriveData().messageName,
  Device.GRIPPER => GripperData().messageName,
  Device.SCIENCE => ScienceData().messageName,
  _ => null,
};

/// Helpful extension methods to convert GpsCoordinates into meters
extension GpsCoordinatesToMeters on GpsCoordinates {
  /// Number of meters per degree of latitude
  static const metersPerLatitude = 111.32 * 1000;

  /// Converts GpsCoordinates into meters
  (num longitudeMeters, num latitudeMeters) get inMeters {
    final metersPerLongitude = 40075 * cos(latitude * (pi / 180)) / 360 * 1000;
    return (latitude * metersPerLatitude, longitude * metersPerLongitude);
  }
}

/// Extension to convert coordinates in meters into Gps Coordinates
extension MeterRecordToGps on (num, num) {
  /// Convert a record of 2 doubles (which represent longitude and latitude coordinates) into Gps Coordinates
  GpsCoordinates get toGpsCoordinates {
    final latitude = $1 / GpsCoordinatesToMeters.metersPerLatitude;
    final metersPerLongitude = 40075 * cos(latitude * (pi / 180)) / 360 * 1000;
    return GpsCoordinates(latitude: latitude, longitude: $2 / metersPerLongitude);
  }

  /// Convert a record of 2 doubles (which represent longitude and latitude coordinates) into Gps Coordinates
  /// 
  /// Alias for [MeterRecordToGps.toGpsCoordinates]
  GpsCoordinates toGps() => toGpsCoordinates;
}
