//
//  Generated code. Do not modify.
//  source: mars.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use antennaControlModeDescriptor instead')
const AntennaControlMode$json = {
  '1': 'AntennaControlMode',
  '2': [
    {'1': 'ANTENNA_CONTROL_MODE_UNDEFINED', '2': 0},
    {'1': 'TRACK_ROVER', '2': 1},
    {'1': 'MANUAL_SPEED', '2': 2},
    {'1': 'STOP_ANTENNA', '2': 3},
  ],
};

/// Descriptor for `AntennaControlMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List antennaControlModeDescriptor = $convert.base64Decode(
    'ChJBbnRlbm5hQ29udHJvbE1vZGUSIgoeQU5URU5OQV9DT05UUk9MX01PREVfVU5ERUZJTkVEEA'
    'ASDwoLVFJBQ0tfUk9WRVIQARIQCgxNQU5VQUxfU1BFRUQQAhIQCgxTVE9QX0FOVEVOTkEQAw==');

@$core.Deprecated('Use antennaCommandDescriptor instead')
const AntennaCommand$json = {
  '1': 'AntennaCommand',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 11, '6': '.Version', '10': 'version'},
    {'1': 'mode', '3': 2, '4': 1, '5': 14, '6': '.AntennaControlMode', '10': 'mode'},
    {'1': 'baseStationCoordinates', '3': 3, '4': 1, '5': 11, '6': '.GpsCoordinates', '10': 'baseStationCoordinates'},
    {'1': 'roverCoordinatesOverride', '3': 4, '4': 1, '5': 11, '6': '.GpsCoordinates', '10': 'roverCoordinatesOverride'},
    {'1': 'angleTolerance', '3': 5, '4': 1, '5': 2, '10': 'angleTolerance'},
    {'1': 'swivelSpeed', '3': 6, '4': 1, '5': 2, '10': 'swivelSpeed'},
  ],
};

/// Descriptor for `AntennaCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List antennaCommandDescriptor = $convert.base64Decode(
    'Cg5BbnRlbm5hQ29tbWFuZBIiCgd2ZXJzaW9uGAEgASgLMgguVmVyc2lvblIHdmVyc2lvbhInCg'
    'Rtb2RlGAIgASgOMhMuQW50ZW5uYUNvbnRyb2xNb2RlUgRtb2RlEkcKFmJhc2VTdGF0aW9uQ29v'
    'cmRpbmF0ZXMYAyABKAsyDy5HcHNDb29yZGluYXRlc1IWYmFzZVN0YXRpb25Db29yZGluYXRlcx'
    'JLChhyb3ZlckNvb3JkaW5hdGVzT3ZlcnJpZGUYBCABKAsyDy5HcHNDb29yZGluYXRlc1IYcm92'
    'ZXJDb29yZGluYXRlc092ZXJyaWRlEiYKDmFuZ2xlVG9sZXJhbmNlGAUgASgCUg5hbmdsZVRvbG'
    'VyYW5jZRIgCgtzd2l2ZWxTcGVlZBgGIAEoAlILc3dpdmVsU3BlZWQ=');

@$core.Deprecated('Use antennaMotorCommandDescriptor instead')
const AntennaMotorCommand$json = {
  '1': 'AntennaMotorCommand',
  '2': [
    {'1': 'moveSteps', '3': 1, '4': 1, '5': 5, '10': 'moveSteps'},
    {'1': 'moveRadians', '3': 2, '4': 1, '5': 2, '10': 'moveRadians'},
    {'1': 'targetAngle', '3': 3, '4': 1, '5': 2, '10': 'targetAngle'},
    {'1': 'zeroPosition', '3': 4, '4': 1, '5': 8, '10': 'zeroPosition'},
  ],
};

/// Descriptor for `AntennaMotorCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List antennaMotorCommandDescriptor = $convert.base64Decode(
    'ChNBbnRlbm5hTW90b3JDb21tYW5kEhwKCW1vdmVTdGVwcxgBIAEoBVIJbW92ZVN0ZXBzEiAKC2'
    '1vdmVSYWRpYW5zGAIgASgCUgttb3ZlUmFkaWFucxIgCgt0YXJnZXRBbmdsZRgDIAEoAlILdGFy'
    'Z2V0QW5nbGUSIgoMemVyb1Bvc2l0aW9uGAQgASgIUgx6ZXJvUG9zaXRpb24=');

@$core.Deprecated('Use antennaDataDescriptor instead')
const AntennaData$json = {
  '1': 'AntennaData',
  '2': [
    {'1': 'angle', '3': 1, '4': 1, '5': 2, '10': 'angle'},
    {'1': 'targetAngle', '3': 2, '4': 1, '5': 2, '10': 'targetAngle'},
    {'1': 'currentStep', '3': 3, '4': 1, '5': 5, '10': 'currentStep'},
    {'1': 'targetStep', '3': 4, '4': 1, '5': 5, '10': 'targetStep'},
  ],
};

/// Descriptor for `AntennaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List antennaDataDescriptor = $convert.base64Decode(
    'CgtBbnRlbm5hRGF0YRIUCgVhbmdsZRgBIAEoAlIFYW5nbGUSIAoLdGFyZ2V0QW5nbGUYAiABKA'
    'JSC3RhcmdldEFuZ2xlEiAKC2N1cnJlbnRTdGVwGAMgASgFUgtjdXJyZW50U3RlcBIeCgp0YXJn'
    'ZXRTdGVwGAQgASgFUgp0YXJnZXRTdGVw');

@$core.Deprecated('Use baseStationDataDescriptor instead')
const BaseStationData$json = {
  '1': 'BaseStationData',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 11, '6': '.Version', '10': 'version'},
    {'1': 'antenna', '3': 2, '4': 1, '5': 11, '6': '.AntennaData', '10': 'antenna'},
    {'1': 'orientation', '3': 3, '4': 1, '5': 11, '6': '.Orientation', '10': 'orientation'},
  ],
};

/// Descriptor for `BaseStationData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List baseStationDataDescriptor = $convert.base64Decode(
    'Cg9CYXNlU3RhdGlvbkRhdGESIgoHdmVyc2lvbhgBIAEoCzIILlZlcnNpb25SB3ZlcnNpb24SJg'
    'oHYW50ZW5uYRgCIAEoCzIMLkFudGVubmFEYXRhUgdhbnRlbm5hEi4KC29yaWVudGF0aW9uGAMg'
    'ASgLMgwuT3JpZW50YXRpb25SC29yaWVudGF0aW9u');

