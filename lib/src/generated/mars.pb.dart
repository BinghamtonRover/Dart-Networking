//
//  Generated code. Do not modify.
//  source: mars.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'gps.pb.dart' as $2;
import 'mars.pbenum.dart';
import 'version.pb.dart' as $0;

export 'mars.pbenum.dart';

/// / Command to control the movement of the MARS antenna
class AntennaCommand extends $pb.GeneratedMessage {
  factory AntennaCommand({
    $0.Version? version,
    AntennaControlMode? mode,
    $2.GpsCoordinates? baseStationCoordinates,
    $2.GpsCoordinates? roverCoordinatesOverride,
    $core.double? angleTolerance,
    $core.double? swivelSpeed,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (mode != null) {
      $result.mode = mode;
    }
    if (baseStationCoordinates != null) {
      $result.baseStationCoordinates = baseStationCoordinates;
    }
    if (roverCoordinatesOverride != null) {
      $result.roverCoordinatesOverride = roverCoordinatesOverride;
    }
    if (angleTolerance != null) {
      $result.angleTolerance = angleTolerance;
    }
    if (swivelSpeed != null) {
      $result.swivelSpeed = swivelSpeed;
    }
    return $result;
  }
  AntennaCommand._() : super();
  factory AntennaCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AntennaCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AntennaCommand', createEmptyInstance: create)
    ..aOM<$0.Version>(1, _omitFieldNames ? '' : 'version', subBuilder: $0.Version.create)
    ..e<AntennaControlMode>(2, _omitFieldNames ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: AntennaControlMode.ANTENNA_CONTROL_MODE_UNDEFINED, valueOf: AntennaControlMode.valueOf, enumValues: AntennaControlMode.values)
    ..aOM<$2.GpsCoordinates>(3, _omitFieldNames ? '' : 'baseStationCoordinates', protoName: 'baseStationCoordinates', subBuilder: $2.GpsCoordinates.create)
    ..aOM<$2.GpsCoordinates>(4, _omitFieldNames ? '' : 'roverCoordinatesOverride', protoName: 'roverCoordinatesOverride', subBuilder: $2.GpsCoordinates.create)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'angleTolerance', $pb.PbFieldType.OF, protoName: 'angleTolerance')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'swivelSpeed', $pb.PbFieldType.OF, protoName: 'swivelSpeed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AntennaCommand clone() => AntennaCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AntennaCommand copyWith(void Function(AntennaCommand) updates) => super.copyWith((message) => updates(message as AntennaCommand)) as AntennaCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AntennaCommand create() => AntennaCommand._();
  AntennaCommand createEmptyInstance() => create();
  static $pb.PbList<AntennaCommand> createRepeated() => $pb.PbList<AntennaCommand>();
  @$core.pragma('dart2js:noInline')
  static AntennaCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AntennaCommand>(create);
  static AntennaCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Version get version => $_getN(0);
  @$pb.TagNumber(1)
  set version($0.Version v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);
  @$pb.TagNumber(1)
  $0.Version ensureVersion() => $_ensure(0);

  @$pb.TagNumber(2)
  AntennaControlMode get mode => $_getN(1);
  @$pb.TagNumber(2)
  set mode(AntennaControlMode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  @$pb.TagNumber(3)
  $2.GpsCoordinates get baseStationCoordinates => $_getN(2);
  @$pb.TagNumber(3)
  set baseStationCoordinates($2.GpsCoordinates v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBaseStationCoordinates() => $_has(2);
  @$pb.TagNumber(3)
  void clearBaseStationCoordinates() => clearField(3);
  @$pb.TagNumber(3)
  $2.GpsCoordinates ensureBaseStationCoordinates() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.GpsCoordinates get roverCoordinatesOverride => $_getN(3);
  @$pb.TagNumber(4)
  set roverCoordinatesOverride($2.GpsCoordinates v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoverCoordinatesOverride() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoverCoordinatesOverride() => clearField(4);
  @$pb.TagNumber(4)
  $2.GpsCoordinates ensureRoverCoordinatesOverride() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.double get angleTolerance => $_getN(4);
  @$pb.TagNumber(5)
  set angleTolerance($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAngleTolerance() => $_has(4);
  @$pb.TagNumber(5)
  void clearAngleTolerance() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get swivelSpeed => $_getN(5);
  @$pb.TagNumber(6)
  set swivelSpeed($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSwivelSpeed() => $_has(5);
  @$pb.TagNumber(6)
  void clearSwivelSpeed() => clearField(6);
}

class AntennaMotorCommand extends $pb.GeneratedMessage {
  factory AntennaMotorCommand({
    $core.int? moveSteps,
    $core.double? moveRadians,
    $core.double? targetAngle,
    $core.bool? zeroPosition,
  }) {
    final $result = create();
    if (moveSteps != null) {
      $result.moveSteps = moveSteps;
    }
    if (moveRadians != null) {
      $result.moveRadians = moveRadians;
    }
    if (targetAngle != null) {
      $result.targetAngle = targetAngle;
    }
    if (zeroPosition != null) {
      $result.zeroPosition = zeroPosition;
    }
    return $result;
  }
  AntennaMotorCommand._() : super();
  factory AntennaMotorCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AntennaMotorCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AntennaMotorCommand', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'moveSteps', $pb.PbFieldType.O3, protoName: 'moveSteps')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'moveRadians', $pb.PbFieldType.OF, protoName: 'moveRadians')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'targetAngle', $pb.PbFieldType.OF, protoName: 'targetAngle')
    ..aOB(4, _omitFieldNames ? '' : 'zeroPosition', protoName: 'zeroPosition')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AntennaMotorCommand clone() => AntennaMotorCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AntennaMotorCommand copyWith(void Function(AntennaMotorCommand) updates) => super.copyWith((message) => updates(message as AntennaMotorCommand)) as AntennaMotorCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AntennaMotorCommand create() => AntennaMotorCommand._();
  AntennaMotorCommand createEmptyInstance() => create();
  static $pb.PbList<AntennaMotorCommand> createRepeated() => $pb.PbList<AntennaMotorCommand>();
  @$core.pragma('dart2js:noInline')
  static AntennaMotorCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AntennaMotorCommand>(create);
  static AntennaMotorCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get moveSteps => $_getIZ(0);
  @$pb.TagNumber(1)
  set moveSteps($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMoveSteps() => $_has(0);
  @$pb.TagNumber(1)
  void clearMoveSteps() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get moveRadians => $_getN(1);
  @$pb.TagNumber(2)
  set moveRadians($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMoveRadians() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoveRadians() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get targetAngle => $_getN(2);
  @$pb.TagNumber(3)
  set targetAngle($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTargetAngle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetAngle() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get zeroPosition => $_getBF(3);
  @$pb.TagNumber(4)
  set zeroPosition($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasZeroPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearZeroPosition() => clearField(4);
}

class AntennaData extends $pb.GeneratedMessage {
  factory AntennaData({
    $core.double? angle,
    $core.double? targetAngle,
    $core.int? currentStep,
    $core.int? targetStep,
  }) {
    final $result = create();
    if (angle != null) {
      $result.angle = angle;
    }
    if (targetAngle != null) {
      $result.targetAngle = targetAngle;
    }
    if (currentStep != null) {
      $result.currentStep = currentStep;
    }
    if (targetStep != null) {
      $result.targetStep = targetStep;
    }
    return $result;
  }
  AntennaData._() : super();
  factory AntennaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AntennaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AntennaData', createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'angle', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'targetAngle', $pb.PbFieldType.OF, protoName: 'targetAngle')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'currentStep', $pb.PbFieldType.O3, protoName: 'currentStep')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'targetStep', $pb.PbFieldType.O3, protoName: 'targetStep')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AntennaData clone() => AntennaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AntennaData copyWith(void Function(AntennaData) updates) => super.copyWith((message) => updates(message as AntennaData)) as AntennaData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AntennaData create() => AntennaData._();
  AntennaData createEmptyInstance() => create();
  static $pb.PbList<AntennaData> createRepeated() => $pb.PbList<AntennaData>();
  @$core.pragma('dart2js:noInline')
  static AntennaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AntennaData>(create);
  static AntennaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get angle => $_getN(0);
  @$pb.TagNumber(1)
  set angle($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAngle() => $_has(0);
  @$pb.TagNumber(1)
  void clearAngle() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get targetAngle => $_getN(1);
  @$pb.TagNumber(2)
  set targetAngle($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetAngle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetAngle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get currentStep => $_getIZ(2);
  @$pb.TagNumber(3)
  set currentStep($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentStep() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get targetStep => $_getIZ(3);
  @$pb.TagNumber(4)
  set targetStep($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTargetStep() => $_has(3);
  @$pb.TagNumber(4)
  void clearTargetStep() => clearField(4);
}

class BaseStationData extends $pb.GeneratedMessage {
  factory BaseStationData({
    $0.Version? version,
    AntennaData? antenna,
    $2.Orientation? orientation,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (antenna != null) {
      $result.antenna = antenna;
    }
    if (orientation != null) {
      $result.orientation = orientation;
    }
    return $result;
  }
  BaseStationData._() : super();
  factory BaseStationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BaseStationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BaseStationData', createEmptyInstance: create)
    ..aOM<$0.Version>(1, _omitFieldNames ? '' : 'version', subBuilder: $0.Version.create)
    ..aOM<AntennaData>(2, _omitFieldNames ? '' : 'antenna', subBuilder: AntennaData.create)
    ..aOM<$2.Orientation>(3, _omitFieldNames ? '' : 'orientation', subBuilder: $2.Orientation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BaseStationData clone() => BaseStationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BaseStationData copyWith(void Function(BaseStationData) updates) => super.copyWith((message) => updates(message as BaseStationData)) as BaseStationData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseStationData create() => BaseStationData._();
  BaseStationData createEmptyInstance() => create();
  static $pb.PbList<BaseStationData> createRepeated() => $pb.PbList<BaseStationData>();
  @$core.pragma('dart2js:noInline')
  static BaseStationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseStationData>(create);
  static BaseStationData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Version get version => $_getN(0);
  @$pb.TagNumber(1)
  set version($0.Version v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);
  @$pb.TagNumber(1)
  $0.Version ensureVersion() => $_ensure(0);

  @$pb.TagNumber(2)
  AntennaData get antenna => $_getN(1);
  @$pb.TagNumber(2)
  set antenna(AntennaData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAntenna() => $_has(1);
  @$pb.TagNumber(2)
  void clearAntenna() => clearField(2);
  @$pb.TagNumber(2)
  AntennaData ensureAntenna() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Orientation get orientation => $_getN(2);
  @$pb.TagNumber(3)
  set orientation($2.Orientation v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrientation() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrientation() => clearField(3);
  @$pb.TagNumber(3)
  $2.Orientation ensureOrientation() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
