// This is a generated file - do not edit.
//
// Generated from response.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateProgressEventDescriptor instead')
const UpdateProgressEvent$json = {
  '1': 'UpdateProgressEvent',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 13, '10': 'value'},
    {'1': 'progress', '3': 2, '4': 1, '5': 2, '10': 'progress'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateProgressEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProgressEventDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVQcm9ncmVzc0V2ZW50EhQKBXZhbHVlGAEgASgNUgV2YWx1ZRIaCghwcm9ncmVzcx'
    'gCIAEoAlIIcHJvZ3Jlc3MSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use wifiNetworkListDescriptor instead')
const WifiNetworkList$json = {
  '1': 'WifiNetworkList',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 9, '10': 'items'},
    {'1': 'active_index', '3': 2, '4': 1, '5': 5, '10': 'activeIndex'},
  ],
};

/// Descriptor for `WifiNetworkList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiNetworkListDescriptor = $convert.base64Decode(
    'Cg9XaWZpTmV0d29ya0xpc3QSFAoFaXRlbXMYASADKAlSBWl0ZW1zEiEKDGFjdGl2ZV9pbmRleB'
    'gCIAEoBVILYWN0aXZlSW5kZXg=');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.error.Error',
      '9': 0,
      '10': 'error'
    },
    {
      '1': 'ok',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'ok'
    },
    {'1': 'bool', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'bool'},
    {'1': 'uint32', '3': 4, '4': 1, '5': 13, '9': 0, '10': 'uint32'},
    {'1': 'uint64', '3': 5, '4': 1, '5': 4, '9': 0, '10': 'uint64'},
    {'1': 'int32', '3': 6, '4': 1, '5': 5, '9': 0, '10': 'int32'},
    {'1': 'int64', '3': 7, '4': 1, '5': 3, '9': 0, '10': 'int64'},
    {'1': 'float', '3': 8, '4': 1, '5': 2, '9': 0, '10': 'float'},
    {'1': 'double', '3': 9, '4': 1, '5': 1, '9': 0, '10': 'double'},
    {
      '1': 'date',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'date'
    },
    {
      '1': 'preset_info',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.remote.PresetInfo',
      '9': 0,
      '10': 'presetInfo'
    },
    {
      '1': 'schedule',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.remote.Schedule',
      '9': 0,
      '10': 'schedule'
    },
    {
      '1': 'schedule_rotations',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.remote.ScheduleRotationList',
      '9': 0,
      '10': 'scheduleRotations'
    },
    {
      '1': 'selection',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.remote.Selection',
      '9': 0,
      '10': 'selection'
    },
    {
      '1': 'preset_list',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.remote.PresetList',
      '9': 0,
      '10': 'presetList'
    },
    {
      '1': 'song_list',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.remote.SongList',
      '9': 0,
      '10': 'songList'
    },
    {
      '1': 'update_progress_event',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.response.UpdateProgressEvent',
      '9': 0,
      '10': 'updateProgressEvent'
    },
    {
      '1': 'wifi_network_list',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.response.WifiNetworkList',
      '9': 0,
      '10': 'wifiNetworkList'
    },
  ],
  '8': [
    {'1': 'response'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRIkCgVlcnJvchgBIAEoCzIMLmVycm9yLkVycm9ySABSBWVycm9yEigKAm9rGA'
    'IgASgLMhYuZ29vZ2xlLnByb3RvYnVmLkVtcHR5SABSAm9rEhQKBGJvb2wYAyABKAhIAFIEYm9v'
    'bBIYCgZ1aW50MzIYBCABKA1IAFIGdWludDMyEhgKBnVpbnQ2NBgFIAEoBEgAUgZ1aW50NjQSFg'
    'oFaW50MzIYBiABKAVIAFIFaW50MzISFgoFaW50NjQYByABKANIAFIFaW50NjQSFgoFZmxvYXQY'
    'CCABKAJIAFIFZmxvYXQSGAoGZG91YmxlGAkgASgBSABSBmRvdWJsZRIwCgRkYXRlGAogASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgAUgRkYXRlEjUKC3ByZXNldF9pbmZvGAsgASgL'
    'MhIucmVtb3RlLlByZXNldEluZm9IAFIKcHJlc2V0SW5mbxIuCghzY2hlZHVsZRgMIAEoCzIQLn'
    'JlbW90ZS5TY2hlZHVsZUgAUghzY2hlZHVsZRJNChJzY2hlZHVsZV9yb3RhdGlvbnMYDSABKAsy'
    'HC5yZW1vdGUuU2NoZWR1bGVSb3RhdGlvbkxpc3RIAFIRc2NoZWR1bGVSb3RhdGlvbnMSMQoJc2'
    'VsZWN0aW9uGA4gASgLMhEucmVtb3RlLlNlbGVjdGlvbkgAUglzZWxlY3Rpb24SNQoLcHJlc2V0'
    'X2xpc3QYDyABKAsyEi5yZW1vdGUuUHJlc2V0TGlzdEgAUgpwcmVzZXRMaXN0Ei8KCXNvbmdfbG'
    'lzdBgQIAEoCzIQLnJlbW90ZS5Tb25nTGlzdEgAUghzb25nTGlzdBJTChV1cGRhdGVfcHJvZ3Jl'
    'c3NfZXZlbnQYESABKAsyHS5yZXNwb25zZS5VcGRhdGVQcm9ncmVzc0V2ZW50SABSE3VwZGF0ZV'
    'Byb2dyZXNzRXZlbnQSRwoRd2lmaV9uZXR3b3JrX2xpc3QYEiABKAsyGS5yZXNwb25zZS5XaWZp'
    'TmV0d29ya0xpc3RIAFIPd2lmaU5ldHdvcmtMaXN0QgoKCHJlc3BvbnNl');
