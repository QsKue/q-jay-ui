// This is a generated file - do not edit.
//
// Generated from request_playback.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use setupDescriptor instead')
const Setup$json = {
  '1': 'Setup',
};

/// Descriptor for `Setup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setupDescriptor =
    $convert.base64Decode('CgVTZXR1cA==');

@$core.Deprecated('Use playDescriptor instead')
const Play$json = {
  '1': 'Play',
};

/// Descriptor for `Play`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playDescriptor = $convert.base64Decode('CgRQbGF5');

@$core.Deprecated('Use pauseDescriptor instead')
const Pause$json = {
  '1': 'Pause',
};

/// Descriptor for `Pause`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pauseDescriptor =
    $convert.base64Decode('CgVQYXVzZQ==');

@$core.Deprecated('Use stopDescriptor instead')
const Stop$json = {
  '1': 'Stop',
};

/// Descriptor for `Stop`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopDescriptor = $convert.base64Decode('CgRTdG9w');

@$core.Deprecated('Use nextDescriptor instead')
const Next$json = {
  '1': 'Next',
};

/// Descriptor for `Next`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nextDescriptor = $convert.base64Decode('CgROZXh0');

@$core.Deprecated('Use skipToSongDescriptor instead')
const SkipToSong$json = {
  '1': 'SkipToSong',
  '2': [
    {'1': 'song_id', '3': 1, '4': 1, '5': 12, '10': 'songId'},
  ],
};

/// Descriptor for `SkipToSong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List skipToSongDescriptor = $convert
    .base64Decode('CgpTa2lwVG9Tb25nEhcKB3NvbmdfaWQYASABKAxSBnNvbmdJZA==');

@$core.Deprecated('Use getCurrentPresetDescriptor instead')
const GetCurrentPreset$json = {
  '1': 'GetCurrentPreset',
};

/// Descriptor for `GetCurrentPreset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentPresetDescriptor =
    $convert.base64Decode('ChBHZXRDdXJyZW50UHJlc2V0');

@$core.Deprecated('Use getCurrentSongDescriptor instead')
const GetCurrentSong$json = {
  '1': 'GetCurrentSong',
};

/// Descriptor for `GetCurrentSong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentSongDescriptor =
    $convert.base64Decode('Cg5HZXRDdXJyZW50U29uZw==');

@$core.Deprecated('Use getCurrentStateDescriptor instead')
const GetCurrentState$json = {
  '1': 'GetCurrentState',
};

/// Descriptor for `GetCurrentState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurrentStateDescriptor =
    $convert.base64Decode('Cg9HZXRDdXJyZW50U3RhdGU=');

@$core.Deprecated('Use setProgressDescriptor instead')
const SetProgress$json = {
  '1': 'SetProgress',
  '2': [
    {'1': 'percentage', '3': 1, '4': 1, '5': 2, '10': 'percentage'},
  ],
};

/// Descriptor for `SetProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setProgressDescriptor = $convert.base64Decode(
    'CgtTZXRQcm9ncmVzcxIeCgpwZXJjZW50YWdlGAEgASgCUgpwZXJjZW50YWdl');

@$core.Deprecated('Use getVolumeDescriptor instead')
const GetVolume$json = {
  '1': 'GetVolume',
};

/// Descriptor for `GetVolume`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVolumeDescriptor =
    $convert.base64Decode('CglHZXRWb2x1bWU=');

@$core.Deprecated('Use setVolumeDescriptor instead')
const SetVolume$json = {
  '1': 'SetVolume',
  '2': [
    {'1': 'percentage', '3': 1, '4': 1, '5': 2, '10': 'percentage'},
  ],
};

/// Descriptor for `SetVolume`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setVolumeDescriptor = $convert.base64Decode(
    'CglTZXRWb2x1bWUSHgoKcGVyY2VudGFnZRgBIAEoAlIKcGVyY2VudGFnZQ==');

@$core.Deprecated('Use playbackRequestDescriptor instead')
const PlaybackRequest$json = {
  '1': 'PlaybackRequest',
  '2': [
    {
      '1': 'setup',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.request_playback.Setup',
      '9': 0,
      '10': 'setup'
    },
    {
      '1': 'play',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.request_playback.Play',
      '9': 0,
      '10': 'play'
    },
    {
      '1': 'pause',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.request_playback.Pause',
      '9': 0,
      '10': 'pause'
    },
    {
      '1': 'stop',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.request_playback.Stop',
      '9': 0,
      '10': 'stop'
    },
    {
      '1': 'next',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.request_playback.Next',
      '9': 0,
      '10': 'next'
    },
    {
      '1': 'skip_to_song',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.request_playback.SkipToSong',
      '9': 0,
      '10': 'skipToSong'
    },
    {
      '1': 'get_current_preset',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.request_playback.GetCurrentPreset',
      '9': 0,
      '10': 'getCurrentPreset'
    },
    {
      '1': 'get_current_song',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.request_playback.GetCurrentSong',
      '9': 0,
      '10': 'getCurrentSong'
    },
    {
      '1': 'get_current_state',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.request_playback.GetCurrentState',
      '9': 0,
      '10': 'getCurrentState'
    },
    {
      '1': 'set_progress',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.request_playback.SetProgress',
      '9': 0,
      '10': 'setProgress'
    },
    {
      '1': 'get_volume',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.request_playback.GetVolume',
      '9': 0,
      '10': 'getVolume'
    },
    {
      '1': 'set_volume',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.request_playback.SetVolume',
      '9': 0,
      '10': 'setVolume'
    },
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `PlaybackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playbackRequestDescriptor = $convert.base64Decode(
    'Cg9QbGF5YmFja1JlcXVlc3QSLwoFc2V0dXAYASABKAsyFy5yZXF1ZXN0X3BsYXliYWNrLlNldH'
    'VwSABSBXNldHVwEiwKBHBsYXkYAiABKAsyFi5yZXF1ZXN0X3BsYXliYWNrLlBsYXlIAFIEcGxh'
    'eRIvCgVwYXVzZRgDIAEoCzIXLnJlcXVlc3RfcGxheWJhY2suUGF1c2VIAFIFcGF1c2USLAoEc3'
    'RvcBgEIAEoCzIWLnJlcXVlc3RfcGxheWJhY2suU3RvcEgAUgRzdG9wEiwKBG5leHQYBSABKAsy'
    'Fi5yZXF1ZXN0X3BsYXliYWNrLk5leHRIAFIEbmV4dBJACgxza2lwX3RvX3NvbmcYBiABKAsyHC'
    '5yZXF1ZXN0X3BsYXliYWNrLlNraXBUb1NvbmdIAFIKc2tpcFRvU29uZxJSChJnZXRfY3VycmVu'
    'dF9wcmVzZXQYByABKAsyIi5yZXF1ZXN0X3BsYXliYWNrLkdldEN1cnJlbnRQcmVzZXRIAFIQZ2'
    'V0Q3VycmVudFByZXNldBJMChBnZXRfY3VycmVudF9zb25nGAggASgLMiAucmVxdWVzdF9wbGF5'
    'YmFjay5HZXRDdXJyZW50U29uZ0gAUg5nZXRDdXJyZW50U29uZxJPChFnZXRfY3VycmVudF9zdG'
    'F0ZRgJIAEoCzIhLnJlcXVlc3RfcGxheWJhY2suR2V0Q3VycmVudFN0YXRlSABSD2dldEN1cnJl'
    'bnRTdGF0ZRJCCgxzZXRfcHJvZ3Jlc3MYCiABKAsyHS5yZXF1ZXN0X3BsYXliYWNrLlNldFByb2'
    'dyZXNzSABSC3NldFByb2dyZXNzEjwKCmdldF92b2x1bWUYCyABKAsyGy5yZXF1ZXN0X3BsYXli'
    'YWNrLkdldFZvbHVtZUgAUglnZXRWb2x1bWUSPAoKc2V0X3ZvbHVtZRgMIAEoCzIbLnJlcXVlc3'
    'RfcGxheWJhY2suU2V0Vm9sdW1lSABSCXNldFZvbHVtZUIICgZhY3Rpb24=');
