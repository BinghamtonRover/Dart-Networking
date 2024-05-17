//
//  Generated code. Do not modify.
//  source: video.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'video.pbenum.dart';

export 'video.pbenum.dart';

/// / Details about a specific camera.
class CameraDetails extends $pb.GeneratedMessage {
  factory CameraDetails({
    CameraName? name,
    $core.int? resolutionWidth,
    $core.int? resolutionHeight,
    $core.int? quality,
    $core.int? fps,
    CameraStatus? status,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (resolutionWidth != null) {
      $result.resolutionWidth = resolutionWidth;
    }
    if (resolutionHeight != null) {
      $result.resolutionHeight = resolutionHeight;
    }
    if (quality != null) {
      $result.quality = quality;
    }
    if (fps != null) {
      $result.fps = fps;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  CameraDetails._() : super();
  factory CameraDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CameraDetails', createEmptyInstance: create)
    ..e<CameraName>(1, _omitFieldNames ? '' : 'name', $pb.PbFieldType.OE, defaultOrMaker: CameraName.CAMERA_NAME_UNDEFINED, valueOf: CameraName.valueOf, enumValues: CameraName.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'resolutionWidth', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'resolutionHeight', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'quality', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'fps', $pb.PbFieldType.O3)
    ..e<CameraStatus>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: CameraStatus.CAMERA_STATUS_UNDEFINED, valueOf: CameraStatus.valueOf, enumValues: CameraStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraDetails clone() => CameraDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraDetails copyWith(void Function(CameraDetails) updates) => super.copyWith((message) => updates(message as CameraDetails)) as CameraDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CameraDetails create() => CameraDetails._();
  CameraDetails createEmptyInstance() => create();
  static $pb.PbList<CameraDetails> createRepeated() => $pb.PbList<CameraDetails>();
  @$core.pragma('dart2js:noInline')
  static CameraDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraDetails>(create);
  static CameraDetails? _defaultInstance;

  /// / The name of the camera.
  @$pb.TagNumber(1)
  CameraName get name => $_getN(0);
  @$pb.TagNumber(1)
  set name(CameraName v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// / The width and height of the image frame.
  @$pb.TagNumber(2)
  $core.int get resolutionWidth => $_getIZ(1);
  @$pb.TagNumber(2)
  set resolutionWidth($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResolutionWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearResolutionWidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get resolutionHeight => $_getIZ(2);
  @$pb.TagNumber(3)
  set resolutionHeight($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResolutionHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolutionHeight() => clearField(3);

  /// / The quality of the frame, as a percentage. Used for JPG compression.
  @$pb.TagNumber(4)
  $core.int get quality => $_getIZ(3);
  @$pb.TagNumber(4)
  set quality($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuality() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuality() => clearField(4);

  /// / The amount of frames per second. Eg, 60 FPS or 24 FPS.
  @$pb.TagNumber(5)
  $core.int get fps => $_getIZ(4);
  @$pb.TagNumber(5)
  set fps($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFps() => $_has(4);
  @$pb.TagNumber(5)
  void clearFps() => clearField(5);

  /// / The status of this camera.
  @$pb.TagNumber(6)
  CameraStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(CameraStatus v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);
}

/// / Reports data about a camera.
class VideoData extends $pb.GeneratedMessage {
  factory VideoData({
    $core.String? id,
    CameraDetails? details,
    $core.List<$core.int>? frame,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (details != null) {
      $result.details = details;
    }
    if (frame != null) {
      $result.frame = frame;
    }
    return $result;
  }
  VideoData._() : super();
  factory VideoData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VideoData', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<CameraDetails>(2, _omitFieldNames ? '' : 'details', subBuilder: CameraDetails.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'frame', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoData clone() => VideoData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoData copyWith(void Function(VideoData) updates) => super.copyWith((message) => updates(message as VideoData)) as VideoData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoData create() => VideoData._();
  VideoData createEmptyInstance() => create();
  static $pb.PbList<VideoData> createRepeated() => $pb.PbList<VideoData>();
  @$core.pragma('dart2js:noInline')
  static VideoData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoData>(create);
  static VideoData? _defaultInstance;

  /// / The unique ID of this camera.
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// / The details for this camera.
  @$pb.TagNumber(2)
  CameraDetails get details => $_getN(1);
  @$pb.TagNumber(2)
  set details(CameraDetails v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => clearField(2);
  @$pb.TagNumber(2)
  CameraDetails ensureDetails() => $_ensure(1);

  /// / The latest frame from this camera.
  @$pb.TagNumber(3)
  $core.List<$core.int> get frame => $_getN(2);
  @$pb.TagNumber(3)
  set frame($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrame() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrame() => clearField(3);
}

/// / Make changes to a camera feeed.
class VideoCommand extends $pb.GeneratedMessage {
  factory VideoCommand({
    $core.String? id,
    CameraDetails? details,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (details != null) {
      $result.details = details;
    }
    return $result;
  }
  VideoCommand._() : super();
  factory VideoCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VideoCommand', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<CameraDetails>(2, _omitFieldNames ? '' : 'details', subBuilder: CameraDetails.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoCommand clone() => VideoCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoCommand copyWith(void Function(VideoCommand) updates) => super.copyWith((message) => updates(message as VideoCommand)) as VideoCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoCommand create() => VideoCommand._();
  VideoCommand createEmptyInstance() => create();
  static $pb.PbList<VideoCommand> createRepeated() => $pb.PbList<VideoCommand>();
  @$core.pragma('dart2js:noInline')
  static VideoCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoCommand>(create);
  static VideoCommand? _defaultInstance;

  /// / The unique ID of the camera to change.
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// / The new details for this camera.
  /// /
  /// / If changing [CameraDetails.status], you cannot set it to [CameraStatus.DISCONNECTED].
  @$pb.TagNumber(2)
  CameraDetails get details => $_getN(1);
  @$pb.TagNumber(2)
  set details(CameraDetails v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => clearField(2);
  @$pb.TagNumber(2)
  CameraDetails ensureDetails() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
