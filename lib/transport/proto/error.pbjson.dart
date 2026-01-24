// This is a generated file - do not edit.
//
// Generated from error.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use errorTypeDescriptor instead')
const ErrorType$json = {
  '1': 'ErrorType',
  '2': [
    {'1': 'IGNORED', '2': 0},
    {'1': 'WARNING', '2': 1},
    {'1': 'ERROR', '2': 2},
    {'1': 'CONNECTION', '2': 3},
  ],
};

/// Descriptor for `ErrorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorTypeDescriptor = $convert.base64Decode(
    'CglFcnJvclR5cGUSCwoHSUdOT1JFRBAAEgsKB1dBUk5JTkcQARIJCgVFUlJPUhACEg4KCkNPTk'
    '5FQ1RJT04QAw==');

@$core.Deprecated('Use setupErrorTypeDescriptor instead')
const SetupErrorType$json = {
  '1': 'SetupErrorType',
  '2': [
    {'1': 'USER_SETUP', '2': 0},
    {'1': 'DATA_SETUP', '2': 1},
  ],
};

/// Descriptor for `SetupErrorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List setupErrorTypeDescriptor = $convert.base64Decode(
    'Cg5TZXR1cEVycm9yVHlwZRIOCgpVU0VSX1NFVFVQEAASDgoKREFUQV9TRVRVUBAB');

@$core.Deprecated('Use genericErrorDescriptor instead')
const GenericError$json = {
  '1': 'GenericError',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.error.ErrorType',
      '10': 'type'
    },
  ],
};

/// Descriptor for `GenericError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genericErrorDescriptor = $convert.base64Decode(
    'CgxHZW5lcmljRXJyb3ISFAoFdGl0bGUYASABKAlSBXRpdGxlEhgKB21lc3NhZ2UYAiABKAlSB2'
    '1lc3NhZ2USJAoEdHlwZRgDIAEoDjIQLmVycm9yLkVycm9yVHlwZVIEdHlwZQ==');

@$core.Deprecated('Use setupErrorDescriptor instead')
const SetupError$json = {
  '1': 'SetupError',
  '2': [
    {
      '1': 'code',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.error.SetupErrorType',
      '10': 'code'
    },
  ],
};

/// Descriptor for `SetupError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setupErrorDescriptor = $convert.base64Decode(
    'CgpTZXR1cEVycm9yEikKBGNvZGUYASABKA4yFS5lcnJvci5TZXR1cEVycm9yVHlwZVIEY29kZQ'
    '==');

@$core.Deprecated('Use subscriptionExpiredErrorDescriptor instead')
const SubscriptionExpiredError$json = {
  '1': 'SubscriptionExpiredError',
  '2': [
    {'1': 'checked', '3': 1, '4': 1, '5': 8, '10': 'checked'},
  ],
};

/// Descriptor for `SubscriptionExpiredError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionExpiredErrorDescriptor =
    $convert.base64Decode(
        'ChhTdWJzY3JpcHRpb25FeHBpcmVkRXJyb3ISGAoHY2hlY2tlZBgBIAEoCFIHY2hlY2tlZA==');

@$core.Deprecated('Use securityErrorDescriptor instead')
const SecurityError$json = {
  '1': 'SecurityError',
};

/// Descriptor for `SecurityError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securityErrorDescriptor =
    $convert.base64Decode('Cg1TZWN1cml0eUVycm9y');

@$core.Deprecated('Use errorDescriptor instead')
const Error$json = {
  '1': 'Error',
  '2': [
    {
      '1': 'generic',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.error.GenericError',
      '9': 0,
      '10': 'generic'
    },
    {
      '1': 'setup',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.error.SetupError',
      '9': 0,
      '10': 'setup'
    },
    {
      '1': 'subscription_expired',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.error.SubscriptionExpiredError',
      '9': 0,
      '10': 'subscriptionExpired'
    },
    {
      '1': 'security',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.error.SecurityError',
      '9': 0,
      '10': 'security'
    },
  ],
  '8': [
    {'1': 'error'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchIvCgdnZW5lcmljGAEgASgLMhMuZXJyb3IuR2VuZXJpY0Vycm9ySABSB2dlbmVyaW'
    'MSKQoFc2V0dXAYAiABKAsyES5lcnJvci5TZXR1cEVycm9ySABSBXNldHVwElQKFHN1YnNjcmlw'
    'dGlvbl9leHBpcmVkGAMgASgLMh8uZXJyb3IuU3Vic2NyaXB0aW9uRXhwaXJlZEVycm9ySABSE3'
    'N1YnNjcmlwdGlvbkV4cGlyZWQSMgoIc2VjdXJpdHkYBCABKAsyFC5lcnJvci5TZWN1cml0eUVy'
    'cm9ySABSCHNlY3VyaXR5QgcKBWVycm9y');
