// This is a generated file - do not edit.
//
// Generated from request_repo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getPresetCountDescriptor instead')
const GetPresetCount$json = {
  '1': 'GetPresetCount',
};

/// Descriptor for `GetPresetCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPresetCountDescriptor =
    $convert.base64Decode('Cg5HZXRQcmVzZXRDb3VudA==');

@$core.Deprecated('Use getPresetsDescriptor instead')
const GetPresets$json = {
  '1': 'GetPresets',
  '2': [
    {'1': 'start_index', '3': 1, '4': 1, '5': 13, '10': 'startIndex'},
    {'1': 'end_index', '3': 2, '4': 1, '5': 13, '10': 'endIndex'},
  ],
};

/// Descriptor for `GetPresets`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPresetsDescriptor = $convert.base64Decode(
    'CgpHZXRQcmVzZXRzEh8KC3N0YXJ0X2luZGV4GAEgASgNUgpzdGFydEluZGV4EhsKCWVuZF9pbm'
    'RleBgCIAEoDVIIZW5kSW5kZXg=');

@$core.Deprecated('Use getScheduleDescriptor instead')
const GetSchedule$json = {
  '1': 'GetSchedule',
  '2': [
    {'1': 'schedule_id', '3': 1, '4': 1, '5': 12, '10': 'scheduleId'},
  ],
};

/// Descriptor for `GetSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScheduleDescriptor = $convert.base64Decode(
    'CgtHZXRTY2hlZHVsZRIfCgtzY2hlZHVsZV9pZBgBIAEoDFIKc2NoZWR1bGVJZA==');

@$core.Deprecated('Use getScheduleRotationsDescriptor instead')
const GetScheduleRotations$json = {
  '1': 'GetScheduleRotations',
  '2': [
    {'1': 'schedule_id', '3': 1, '4': 1, '5': 12, '10': 'scheduleId'},
    {'1': 'start_index', '3': 2, '4': 1, '5': 13, '10': 'startIndex'},
    {'1': 'end_index', '3': 3, '4': 1, '5': 13, '10': 'endIndex'},
  ],
};

/// Descriptor for `GetScheduleRotations`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScheduleRotationsDescriptor = $convert.base64Decode(
    'ChRHZXRTY2hlZHVsZVJvdGF0aW9ucxIfCgtzY2hlZHVsZV9pZBgBIAEoDFIKc2NoZWR1bGVJZB'
    'IfCgtzdGFydF9pbmRleBgCIAEoDVIKc3RhcnRJbmRleBIbCgllbmRfaW5kZXgYAyABKA1SCGVu'
    'ZEluZGV4');

@$core.Deprecated('Use getSelectionDescriptor instead')
const GetSelection$json = {
  '1': 'GetSelection',
  '2': [
    {'1': 'selection_id', '3': 1, '4': 1, '5': 12, '10': 'selectionId'},
  ],
};

/// Descriptor for `GetSelection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSelectionDescriptor = $convert.base64Decode(
    'CgxHZXRTZWxlY3Rpb24SIQoMc2VsZWN0aW9uX2lkGAEgASgMUgtzZWxlY3Rpb25JZA==');

@$core.Deprecated('Use getSelectionSongCountDescriptor instead')
const GetSelectionSongCount$json = {
  '1': 'GetSelectionSongCount',
  '2': [
    {'1': 'selection_id', '3': 1, '4': 1, '5': 12, '10': 'selectionId'},
    {'1': 'energies', '3': 2, '4': 1, '5': 12, '10': 'energies'},
  ],
};

/// Descriptor for `GetSelectionSongCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSelectionSongCountDescriptor = $convert.base64Decode(
    'ChVHZXRTZWxlY3Rpb25Tb25nQ291bnQSIQoMc2VsZWN0aW9uX2lkGAEgASgMUgtzZWxlY3Rpb2'
    '5JZBIaCghlbmVyZ2llcxgCIAEoDFIIZW5lcmdpZXM=');

@$core.Deprecated('Use getSelectionSongsDescriptor instead')
const GetSelectionSongs$json = {
  '1': 'GetSelectionSongs',
  '2': [
    {'1': 'selection_id', '3': 1, '4': 1, '5': 12, '10': 'selectionId'},
    {'1': 'energies', '3': 2, '4': 1, '5': 12, '10': 'energies'},
    {'1': 'sort_mode', '3': 3, '4': 1, '5': 13, '10': 'sortMode'},
    {'1': 'start_index', '3': 4, '4': 1, '5': 13, '10': 'startIndex'},
    {'1': 'end_index', '3': 5, '4': 1, '5': 13, '10': 'endIndex'},
  ],
};

/// Descriptor for `GetSelectionSongs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSelectionSongsDescriptor = $convert.base64Decode(
    'ChFHZXRTZWxlY3Rpb25Tb25ncxIhCgxzZWxlY3Rpb25faWQYASABKAxSC3NlbGVjdGlvbklkEh'
    'oKCGVuZXJnaWVzGAIgASgMUghlbmVyZ2llcxIbCglzb3J0X21vZGUYAyABKA1SCHNvcnRNb2Rl'
    'Eh8KC3N0YXJ0X2luZGV4GAQgASgNUgpzdGFydEluZGV4EhsKCWVuZF9pbmRleBgFIAEoDVIIZW'
    '5kSW5kZXg=');

@$core.Deprecated('Use getSongDescriptor instead')
const GetSong$json = {
  '1': 'GetSong',
  '2': [
    {'1': 'song_id', '3': 1, '4': 1, '5': 12, '10': 'songId'},
  ],
};

/// Descriptor for `GetSong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSongDescriptor =
    $convert.base64Decode('CgdHZXRTb25nEhcKB3NvbmdfaWQYASABKAxSBnNvbmdJZA==');

@$core.Deprecated('Use setScheduleDescriptor instead')
const SetSchedule$json = {
  '1': 'SetSchedule',
  '2': [
    {'1': 'schedule_id', '3': 1, '4': 1, '5': 12, '10': 'scheduleId'},
  ],
};

/// Descriptor for `SetSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setScheduleDescriptor = $convert.base64Decode(
    'CgtTZXRTY2hlZHVsZRIfCgtzY2hlZHVsZV9pZBgBIAEoDFIKc2NoZWR1bGVJZA==');

@$core.Deprecated('Use setSelectionDescriptor instead')
const SetSelection$json = {
  '1': 'SetSelection',
  '2': [
    {'1': 'selection_id', '3': 1, '4': 1, '5': 12, '10': 'selectionId'},
    {
      '1': 'start_song_id',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'startSongId',
      '17': true
    },
    {'1': 'energies', '3': 3, '4': 1, '5': 12, '10': 'energies'},
    {'1': 'song_duration', '3': 4, '4': 1, '5': 13, '10': 'songDuration'},
  ],
  '8': [
    {'1': '_start_song_id'},
  ],
};

/// Descriptor for `SetSelection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setSelectionDescriptor = $convert.base64Decode(
    'CgxTZXRTZWxlY3Rpb24SIQoMc2VsZWN0aW9uX2lkGAEgASgMUgtzZWxlY3Rpb25JZBInCg1zdG'
    'FydF9zb25nX2lkGAIgASgMSABSC3N0YXJ0U29uZ0lkiAEBEhoKCGVuZXJnaWVzGAMgASgMUghl'
    'bmVyZ2llcxIjCg1zb25nX2R1cmF0aW9uGAQgASgNUgxzb25nRHVyYXRpb25CEAoOX3N0YXJ0X3'
    'NvbmdfaWQ=');

@$core.Deprecated('Use searchGetCountDescriptor instead')
const SearchGetCount$json = {
  '1': 'SearchGetCount',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `SearchGetCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchGetCountDescriptor = $convert
    .base64Decode('Cg5TZWFyY2hHZXRDb3VudBIUCgVxdWVyeRgBIAEoCVIFcXVlcnk=');

@$core.Deprecated('Use searchGetSongsDescriptor instead')
const SearchGetSongs$json = {
  '1': 'SearchGetSongs',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    {'1': 'start_index', '3': 2, '4': 1, '5': 13, '10': 'startIndex'},
    {'1': 'end_index', '3': 3, '4': 1, '5': 13, '10': 'endIndex'},
  ],
};

/// Descriptor for `SearchGetSongs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchGetSongsDescriptor = $convert.base64Decode(
    'Cg5TZWFyY2hHZXRTb25ncxIUCgVxdWVyeRgBIAEoCVIFcXVlcnkSHwoLc3RhcnRfaW5kZXgYAi'
    'ABKA1SCnN0YXJ0SW5kZXgSGwoJZW5kX2luZGV4GAMgASgNUghlbmRJbmRleA==');

@$core.Deprecated('Use addToExceptionsDescriptor instead')
const AddToExceptions$json = {
  '1': 'AddToExceptions',
  '2': [
    {'1': 'song_id', '3': 1, '4': 1, '5': 12, '10': 'songId'},
    {'1': 'skip_to_next', '3': 2, '4': 1, '5': 8, '10': 'skipToNext'},
  ],
};

/// Descriptor for `AddToExceptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addToExceptionsDescriptor = $convert.base64Decode(
    'Cg9BZGRUb0V4Y2VwdGlvbnMSFwoHc29uZ19pZBgBIAEoDFIGc29uZ0lkEiAKDHNraXBfdG9fbm'
    'V4dBgCIAEoCFIKc2tpcFRvTmV4dA==');

@$core.Deprecated('Use removeFromExceptionsDescriptor instead')
const RemoveFromExceptions$json = {
  '1': 'RemoveFromExceptions',
  '2': [
    {'1': 'song_id', '3': 1, '4': 1, '5': 12, '10': 'songId'},
  ],
};

/// Descriptor for `RemoveFromExceptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFromExceptionsDescriptor =
    $convert.base64Decode(
        'ChRSZW1vdmVGcm9tRXhjZXB0aW9ucxIXCgdzb25nX2lkGAEgASgMUgZzb25nSWQ=');

@$core.Deprecated('Use getPinnedSongCountDescriptor instead')
const GetPinnedSongCount$json = {
  '1': 'GetPinnedSongCount',
};

/// Descriptor for `GetPinnedSongCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPinnedSongCountDescriptor =
    $convert.base64Decode('ChJHZXRQaW5uZWRTb25nQ291bnQ=');

@$core.Deprecated('Use getPinnedSongsDescriptor instead')
const GetPinnedSongs$json = {
  '1': 'GetPinnedSongs',
  '2': [
    {'1': 'start_index', '3': 1, '4': 1, '5': 13, '10': 'startIndex'},
    {'1': 'end_index', '3': 2, '4': 1, '5': 13, '10': 'endIndex'},
  ],
};

/// Descriptor for `GetPinnedSongs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPinnedSongsDescriptor = $convert.base64Decode(
    'Cg5HZXRQaW5uZWRTb25ncxIfCgtzdGFydF9pbmRleBgBIAEoDVIKc3RhcnRJbmRleBIbCgllbm'
    'RfaW5kZXgYAiABKA1SCGVuZEluZGV4');

@$core.Deprecated('Use addToPinnedDescriptor instead')
const AddToPinned$json = {
  '1': 'AddToPinned',
  '2': [
    {'1': 'song_id', '3': 1, '4': 1, '5': 12, '10': 'songId'},
    {'1': 'index', '3': 2, '4': 1, '5': 13, '10': 'index'},
  ],
};

/// Descriptor for `AddToPinned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addToPinnedDescriptor = $convert.base64Decode(
    'CgtBZGRUb1Bpbm5lZBIXCgdzb25nX2lkGAEgASgMUgZzb25nSWQSFAoFaW5kZXgYAiABKA1SBW'
    'luZGV4');

@$core.Deprecated('Use removeFromPinnedDescriptor instead')
const RemoveFromPinned$json = {
  '1': 'RemoveFromPinned',
  '2': [
    {'1': 'song_id', '3': 1, '4': 1, '5': 12, '10': 'songId'},
  ],
};

/// Descriptor for `RemoveFromPinned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFromPinnedDescriptor = $convert.base64Decode(
    'ChBSZW1vdmVGcm9tUGlubmVkEhcKB3NvbmdfaWQYASABKAxSBnNvbmdJZA==');

@$core.Deprecated('Use reorderPinnedDescriptor instead')
const ReorderPinned$json = {
  '1': 'ReorderPinned',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 13, '10': 'a'},
    {'1': 'b', '3': 2, '4': 1, '5': 13, '10': 'b'},
  ],
};

/// Descriptor for `ReorderPinned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reorderPinnedDescriptor = $convert.base64Decode(
    'Cg1SZW9yZGVyUGlubmVkEgwKAWEYASABKA1SAWESDAoBYhgCIAEoDVIBYg==');

@$core.Deprecated('Use repoRequestDescriptor instead')
const RepoRequest$json = {
  '1': 'RepoRequest',
  '2': [
    {
      '1': 'get_preset_count',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetPresetCount',
      '9': 0,
      '10': 'getPresetCount'
    },
    {
      '1': 'get_presets',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetPresets',
      '9': 0,
      '10': 'getPresets'
    },
    {
      '1': 'get_schedule',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetSchedule',
      '9': 0,
      '10': 'getSchedule'
    },
    {
      '1': 'get_schedule_rotations',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetScheduleRotations',
      '9': 0,
      '10': 'getScheduleRotations'
    },
    {
      '1': 'get_selection',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetSelection',
      '9': 0,
      '10': 'getSelection'
    },
    {
      '1': 'get_selection_song_count',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetSelectionSongCount',
      '9': 0,
      '10': 'getSelectionSongCount'
    },
    {
      '1': 'get_selection_songs',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetSelectionSongs',
      '9': 0,
      '10': 'getSelectionSongs'
    },
    {
      '1': 'get_song',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetSong',
      '9': 0,
      '10': 'getSong'
    },
    {
      '1': 'set_schedule',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.request_repo.SetSchedule',
      '9': 0,
      '10': 'setSchedule'
    },
    {
      '1': 'set_selection',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.request_repo.SetSelection',
      '9': 0,
      '10': 'setSelection'
    },
    {
      '1': 'search_get_count',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.request_repo.SearchGetCount',
      '9': 0,
      '10': 'searchGetCount'
    },
    {
      '1': 'search_get_songs',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.request_repo.SearchGetSongs',
      '9': 0,
      '10': 'searchGetSongs'
    },
    {
      '1': 'add_to_exceptions',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.request_repo.AddToExceptions',
      '9': 0,
      '10': 'addToExceptions'
    },
    {
      '1': 'remove_from_exceptions',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.request_repo.RemoveFromExceptions',
      '9': 0,
      '10': 'removeFromExceptions'
    },
    {
      '1': 'get_pinned_song_count',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetPinnedSongCount',
      '9': 0,
      '10': 'getPinnedSongCount'
    },
    {
      '1': 'get_pinned_songs',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.request_repo.GetPinnedSongs',
      '9': 0,
      '10': 'getPinnedSongs'
    },
    {
      '1': 'add_to_pinned',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.request_repo.AddToPinned',
      '9': 0,
      '10': 'addToPinned'
    },
    {
      '1': 'remove_from_pinned',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.request_repo.RemoveFromPinned',
      '9': 0,
      '10': 'removeFromPinned'
    },
    {
      '1': 'reorder_pinned',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.request_repo.ReorderPinned',
      '9': 0,
      '10': 'reorderPinned'
    },
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `RepoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repoRequestDescriptor = $convert.base64Decode(
    'CgtSZXBvUmVxdWVzdBJIChBnZXRfcHJlc2V0X2NvdW50GAEgASgLMhwucmVxdWVzdF9yZXBvLk'
    'dldFByZXNldENvdW50SABSDmdldFByZXNldENvdW50EjsKC2dldF9wcmVzZXRzGAIgASgLMhgu'
    'cmVxdWVzdF9yZXBvLkdldFByZXNldHNIAFIKZ2V0UHJlc2V0cxI+CgxnZXRfc2NoZWR1bGUYAy'
    'ABKAsyGS5yZXF1ZXN0X3JlcG8uR2V0U2NoZWR1bGVIAFILZ2V0U2NoZWR1bGUSWgoWZ2V0X3Nj'
    'aGVkdWxlX3JvdGF0aW9ucxgEIAEoCzIiLnJlcXVlc3RfcmVwby5HZXRTY2hlZHVsZVJvdGF0aW'
    '9uc0gAUhRnZXRTY2hlZHVsZVJvdGF0aW9ucxJBCg1nZXRfc2VsZWN0aW9uGAUgASgLMhoucmVx'
    'dWVzdF9yZXBvLkdldFNlbGVjdGlvbkgAUgxnZXRTZWxlY3Rpb24SXgoYZ2V0X3NlbGVjdGlvbl'
    '9zb25nX2NvdW50GAYgASgLMiMucmVxdWVzdF9yZXBvLkdldFNlbGVjdGlvblNvbmdDb3VudEgA'
    'UhVnZXRTZWxlY3Rpb25Tb25nQ291bnQSUQoTZ2V0X3NlbGVjdGlvbl9zb25ncxgHIAEoCzIfLn'
    'JlcXVlc3RfcmVwby5HZXRTZWxlY3Rpb25Tb25nc0gAUhFnZXRTZWxlY3Rpb25Tb25ncxIyCghn'
    'ZXRfc29uZxgIIAEoCzIVLnJlcXVlc3RfcmVwby5HZXRTb25nSABSB2dldFNvbmcSPgoMc2V0X3'
    'NjaGVkdWxlGAkgASgLMhkucmVxdWVzdF9yZXBvLlNldFNjaGVkdWxlSABSC3NldFNjaGVkdWxl'
    'EkEKDXNldF9zZWxlY3Rpb24YCiABKAsyGi5yZXF1ZXN0X3JlcG8uU2V0U2VsZWN0aW9uSABSDH'
    'NldFNlbGVjdGlvbhJIChBzZWFyY2hfZ2V0X2NvdW50GAsgASgLMhwucmVxdWVzdF9yZXBvLlNl'
    'YXJjaEdldENvdW50SABSDnNlYXJjaEdldENvdW50EkgKEHNlYXJjaF9nZXRfc29uZ3MYDCABKA'
    'syHC5yZXF1ZXN0X3JlcG8uU2VhcmNoR2V0U29uZ3NIAFIOc2VhcmNoR2V0U29uZ3MSSwoRYWRk'
    'X3RvX2V4Y2VwdGlvbnMYDSABKAsyHS5yZXF1ZXN0X3JlcG8uQWRkVG9FeGNlcHRpb25zSABSD2'
    'FkZFRvRXhjZXB0aW9ucxJaChZyZW1vdmVfZnJvbV9leGNlcHRpb25zGA4gASgLMiIucmVxdWVz'
    'dF9yZXBvLlJlbW92ZUZyb21FeGNlcHRpb25zSABSFHJlbW92ZUZyb21FeGNlcHRpb25zElUKFW'
    'dldF9waW5uZWRfc29uZ19jb3VudBgPIAEoCzIgLnJlcXVlc3RfcmVwby5HZXRQaW5uZWRTb25n'
    'Q291bnRIAFISZ2V0UGlubmVkU29uZ0NvdW50EkgKEGdldF9waW5uZWRfc29uZ3MYECABKAsyHC'
    '5yZXF1ZXN0X3JlcG8uR2V0UGlubmVkU29uZ3NIAFIOZ2V0UGlubmVkU29uZ3MSPwoNYWRkX3Rv'
    'X3Bpbm5lZBgRIAEoCzIZLnJlcXVlc3RfcmVwby5BZGRUb1Bpbm5lZEgAUgthZGRUb1Bpbm5lZB'
    'JOChJyZW1vdmVfZnJvbV9waW5uZWQYEiABKAsyHi5yZXF1ZXN0X3JlcG8uUmVtb3ZlRnJvbVBp'
    'bm5lZEgAUhByZW1vdmVGcm9tUGlubmVkEkQKDnJlb3JkZXJfcGlubmVkGBMgASgLMhsucmVxdW'
    'VzdF9yZXBvLlJlb3JkZXJQaW5uZWRIAFINcmVvcmRlclBpbm5lZEIICgZhY3Rpb24=');
