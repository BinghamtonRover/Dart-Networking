//
//  Generated code. Do not modify.
//  source: status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roverStatusDescriptor instead')
const RoverStatus$json = {
  '1': 'RoverStatus',
  '2': [
    {'1': 'DISCONNECTED', '2': 0},
    {'1': 'IDLE', '2': 1},
    {'1': 'MANUAL', '2': 2},
    {'1': 'AUTONOMOUS', '2': 3},
    {'1': 'POWER_OFF', '2': 4},
    {'1': 'RESTART', '2': 5},
  ],
};

/// Descriptor for `RoverStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roverStatusDescriptor = $convert.base64Decode(
    'CgtSb3ZlclN0YXR1cxIQCgxESVNDT05ORUNURUQQABIICgRJRExFEAESCgoGTUFOVUFMEAISDg'
    'oKQVVUT05PTU9VUxADEg0KCVBPV0VSX09GRhAEEgsKB1JFU1RBUlQQBQ==');

