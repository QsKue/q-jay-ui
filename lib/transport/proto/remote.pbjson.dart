// This is a generated file - do not edit.
//
// Generated from remote.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use rotationSegmentDescriptor instead')
const RotationSegment$json = {
  '1': 'RotationSegment',
  '2': [
    {'1': 'minutes', '3': 1, '4': 1, '5': 13, '10': 'minutes'},
    {'1': 'selection_id', '3': 2, '4': 1, '5': 12, '10': 'selectionId'},
    {'1': 'energies', '3': 3, '4': 3, '5': 13, '10': 'energies'},
    {'1': 'song_duration', '3': 4, '4': 1, '5': 13, '10': 'songDuration'},
  ],
};

/// Descriptor for `RotationSegment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rotationSegmentDescriptor = $convert.base64Decode(
    'Cg9Sb3RhdGlvblNlZ21lbnQSGAoHbWludXRlcxgBIAEoDVIHbWludXRlcxIhCgxzZWxlY3Rpb2'
    '5faWQYAiABKAxSC3NlbGVjdGlvbklkEhoKCGVuZXJnaWVzGAMgAygNUghlbmVyZ2llcxIjCg1z'
    'b25nX2R1cmF0aW9uGAQgASgNUgxzb25nRHVyYXRpb24=');

@$core.Deprecated('Use scheduleRotationDescriptor instead')
const ScheduleRotation$json = {
  '1': 'ScheduleRotation',
  '2': [
    {'1': 'minute', '3': 1, '4': 1, '5': 13, '10': 'minute'},
    {
      '1': 'segments',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.remote.RotationSegment',
      '10': 'segments'
    },
  ],
};

/// Descriptor for `ScheduleRotation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRotationDescriptor = $convert.base64Decode(
    'ChBTY2hlZHVsZVJvdGF0aW9uEhYKBm1pbnV0ZRgBIAEoDVIGbWludXRlEjMKCHNlZ21lbnRzGA'
    'IgAygLMhcucmVtb3RlLlJvdGF0aW9uU2VnbWVudFIIc2VnbWVudHM=');

@$core.Deprecated('Use scheduleRotationListDescriptor instead')
const ScheduleRotationList$json = {
  '1': 'ScheduleRotationList',
  '2': [
    {
      '1': 'rotations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.remote.ScheduleRotation',
      '10': 'rotations'
    },
  ],
};

/// Descriptor for `ScheduleRotationList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRotationListDescriptor = $convert.base64Decode(
    'ChRTY2hlZHVsZVJvdGF0aW9uTGlzdBI2Cglyb3RhdGlvbnMYASADKAsyGC5yZW1vdGUuU2NoZW'
    'R1bGVSb3RhdGlvblIJcm90YXRpb25z');

@$core.Deprecated('Use scheduleDescriptor instead')
const Schedule$json = {
  '1': 'Schedule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'pinned', '3': 3, '4': 1, '5': 8, '10': 'pinned'},
    {'1': 'days', '3': 4, '4': 3, '5': 13, '10': 'days'},
    {'1': 'rotation_count', '3': 5, '4': 1, '5': 13, '10': 'rotationCount'},
  ],
};

/// Descriptor for `Schedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleDescriptor = $convert.base64Decode(
    'CghTY2hlZHVsZRIOCgJpZBgBIAEoDFICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZwaW5uZW'
    'QYAyABKAhSBnBpbm5lZBISCgRkYXlzGAQgAygNUgRkYXlzEiUKDnJvdGF0aW9uX2NvdW50GAUg'
    'ASgNUg1yb3RhdGlvbkNvdW50');

@$core.Deprecated('Use selectionDescriptor instead')
const Selection$json = {
  '1': 'Selection',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'category_id', '3': 2, '4': 1, '5': 12, '10': 'categoryId'},
    {'1': 'category', '3': 3, '4': 1, '5': 9, '10': 'category'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'pinned', '3': 5, '4': 1, '5': 8, '10': 'pinned'},
    {
      '1': 'available_energies',
      '3': 6,
      '4': 3,
      '5': 13,
      '10': 'availableEnergies'
    },
    {'1': 'default_energies', '3': 7, '4': 3, '5': 13, '10': 'defaultEnergies'},
    {
      '1': 'default_song_count',
      '3': 8,
      '4': 1,
      '5': 13,
      '10': 'defaultSongCount'
    },
  ],
};

/// Descriptor for `Selection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectionDescriptor = $convert.base64Decode(
    'CglTZWxlY3Rpb24SDgoCaWQYASABKAxSAmlkEh8KC2NhdGVnb3J5X2lkGAIgASgMUgpjYXRlZ2'
    '9yeUlkEhoKCGNhdGVnb3J5GAMgASgJUghjYXRlZ29yeRISCgRuYW1lGAQgASgJUgRuYW1lEhYK'
    'BnBpbm5lZBgFIAEoCFIGcGlubmVkEi0KEmF2YWlsYWJsZV9lbmVyZ2llcxgGIAMoDVIRYXZhaW'
    'xhYmxlRW5lcmdpZXMSKQoQZGVmYXVsdF9lbmVyZ2llcxgHIAMoDVIPZGVmYXVsdEVuZXJnaWVz'
    'EiwKEmRlZmF1bHRfc29uZ19jb3VudBgIIAEoDVIQZGVmYXVsdFNvbmdDb3VudA==');

@$core.Deprecated('Use presetDescriptor instead')
const Preset$json = {
  '1': 'Preset',
  '2': [
    {
      '1': 'schedule',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.remote.Schedule',
      '9': 0,
      '10': 'schedule'
    },
    {
      '1': 'selection',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.Selection',
      '9': 0,
      '10': 'selection'
    },
  ],
  '8': [
    {'1': 'kind'},
  ],
};

/// Descriptor for `Preset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List presetDescriptor = $convert.base64Decode(
    'CgZQcmVzZXQSLgoIc2NoZWR1bGUYASABKAsyEC5yZW1vdGUuU2NoZWR1bGVIAFIIc2NoZWR1bG'
    'USMQoJc2VsZWN0aW9uGAIgASgLMhEucmVtb3RlLlNlbGVjdGlvbkgAUglzZWxlY3Rpb25CBgoE'
    'a2luZA==');

@$core.Deprecated('Use presetInfoDescriptor instead')
const PresetInfo$json = {
  '1': 'PresetInfo',
  '2': [
    {'1': 'mode', '3': 1, '4': 1, '5': 13, '10': 'mode'},
    {'1': 'id', '3': 2, '4': 1, '5': 12, '10': 'id'},
    {'1': 'details', '3': 3, '4': 1, '5': 12, '10': 'details'},
  ],
};

/// Descriptor for `PresetInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List presetInfoDescriptor = $convert.base64Decode(
    'CgpQcmVzZXRJbmZvEhIKBG1vZGUYASABKA1SBG1vZGUSDgoCaWQYAiABKAxSAmlkEhgKB2RldG'
    'FpbHMYAyABKAxSB2RldGFpbHM=');

@$core.Deprecated('Use presetListDescriptor instead')
const PresetList$json = {
  '1': 'PresetList',
  '2': [
    {
      '1': 'presets',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.remote.Preset',
      '10': 'presets'
    },
  ],
};

/// Descriptor for `PresetList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List presetListDescriptor = $convert.base64Decode(
    'CgpQcmVzZXRMaXN0EigKB3ByZXNldHMYASADKAsyDi5yZW1vdGUuUHJlc2V0UgdwcmVzZXRz');

@$core.Deprecated('Use songDescriptor instead')
const Song$json = {
  '1': 'Song',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'artist', '3': 2, '4': 1, '5': 9, '10': 'artist'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'played', '3': 4, '4': 1, '5': 8, '10': 'played'},
    {'1': 'liked', '3': 5, '4': 1, '5': 8, '10': 'liked'},
    {'1': 'pinned', '3': 6, '4': 1, '5': 8, '10': 'pinned'},
    {'1': 'banned', '3': 7, '4': 1, '5': 8, '10': 'banned'},
    {'1': 'date_added_ms', '3': 8, '4': 1, '5': 4, '10': 'dateAddedMs'},
  ],
};

/// Descriptor for `Song`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List songDescriptor = $convert.base64Decode(
    'CgRTb25nEg4KAmlkGAEgASgMUgJpZBIWCgZhcnRpc3QYAiABKAlSBmFydGlzdBIUCgV0aXRsZR'
    'gDIAEoCVIFdGl0bGUSFgoGcGxheWVkGAQgASgIUgZwbGF5ZWQSFAoFbGlrZWQYBSABKAhSBWxp'
    'a2VkEhYKBnBpbm5lZBgGIAEoCFIGcGlubmVkEhYKBmJhbm5lZBgHIAEoCFIGYmFubmVkEiIKDW'
    'RhdGVfYWRkZWRfbXMYCCABKARSC2RhdGVBZGRlZE1z');

@$core.Deprecated('Use songListDescriptor instead')
const SongList$json = {
  '1': 'SongList',
  '2': [
    {'1': 'songs', '3': 1, '4': 3, '5': 11, '6': '.remote.Song', '10': 'songs'},
  ],
};

/// Descriptor for `SongList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List songListDescriptor = $convert.base64Decode(
    'CghTb25nTGlzdBIiCgVzb25ncxgBIAMoCzIMLnJlbW90ZS5Tb25nUgVzb25ncw==');
