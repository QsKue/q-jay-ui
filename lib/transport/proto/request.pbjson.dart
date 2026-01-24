// This is a generated file - do not edit.
//
// Generated from request.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use requestDescriptor instead')
const Request$json = {
  '1': 'Request',
  '2': [
    {
      '1': 'client',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.request_client.ClientRequest',
      '9': 0,
      '10': 'client'
    },
    {
      '1': 'repo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.request_repo.RepoRequest',
      '9': 0,
      '10': 'repo'
    },
    {
      '1': 'playback',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.request_playback.PlaybackRequest',
      '9': 0,
      '10': 'playback'
    },
  ],
  '8': [
    {'1': 'request'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0EjcKBmNsaWVudBgBIAEoCzIdLnJlcXVlc3RfY2xpZW50LkNsaWVudFJlcXVlc3'
    'RIAFIGY2xpZW50Ei8KBHJlcG8YAiABKAsyGS5yZXF1ZXN0X3JlcG8uUmVwb1JlcXVlc3RIAFIE'
    'cmVwbxI/CghwbGF5YmFjaxgDIAEoCzIhLnJlcXVlc3RfcGxheWJhY2suUGxheWJhY2tSZXF1ZX'
    'N0SABSCHBsYXliYWNrQgkKB3JlcXVlc3Q=');
