// This is a generated file - do not edit.
//
// Generated from request_client.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use setupClientDescriptor instead')
const SetupClient$json = {
  '1': 'SetupClient',
  '2': [
    {'1': 'db_path', '3': 1, '4': 1, '5': 9, '10': 'dbPath'},
    {'1': 'id', '3': 4, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SetupClient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setupClientDescriptor = $convert.base64Decode(
    'CgtTZXR1cENsaWVudBIXCgdkYl9wYXRoGAEgASgJUgZkYlBhdGgSDgoCaWQYBCABKAlSAmlkEh'
    'IKBG5hbWUYAyABKAlSBG5hbWU=');

@$core.Deprecated('Use setupWithUpdateDescriptor instead')
const SetupWithUpdate$json = {
  '1': 'SetupWithUpdate',
  '2': [
    {'1': 'db_path', '3': 1, '4': 1, '5': 9, '10': 'dbPath'},
    {'1': 'song_dir', '3': 2, '4': 1, '5': 9, '10': 'songDir'},
  ],
};

/// Descriptor for `SetupWithUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setupWithUpdateDescriptor = $convert.base64Decode(
    'Cg9TZXR1cFdpdGhVcGRhdGUSFwoHZGJfcGF0aBgBIAEoCVIGZGJQYXRoEhkKCHNvbmdfZGlyGA'
    'IgASgJUgdzb25nRGly');

@$core.Deprecated('Use setupRuntimeDescriptor instead')
const SetupRuntime$json = {
  '1': 'SetupRuntime',
  '2': [
    {'1': 'song_dir', '3': 1, '4': 1, '5': 9, '10': 'songDir'},
    {'1': 'db_path', '3': 2, '4': 1, '5': 9, '10': 'dbPath'},
    {'1': 'update_dir', '3': 3, '4': 1, '5': 9, '10': 'updateDir'},
    {'1': 'update_package', '3': 4, '4': 1, '5': 9, '10': 'updatePackage'},
  ],
};

/// Descriptor for `SetupRuntime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setupRuntimeDescriptor = $convert.base64Decode(
    'CgxTZXR1cFJ1bnRpbWUSGQoIc29uZ19kaXIYASABKAlSB3NvbmdEaXISFwoHZGJfcGF0aBgCIA'
    'EoCVIGZGJQYXRoEh0KCnVwZGF0ZV9kaXIYAyABKAlSCXVwZGF0ZURpchIlCg51cGRhdGVfcGFj'
    'a2FnZRgEIAEoCVINdXBkYXRlUGFja2FnZQ==');

@$core.Deprecated('Use getWifiNetworkCountDescriptor instead')
const GetWifiNetworkCount$json = {
  '1': 'GetWifiNetworkCount',
};

/// Descriptor for `GetWifiNetworkCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWifiNetworkCountDescriptor =
    $convert.base64Decode('ChNHZXRXaWZpTmV0d29ya0NvdW50');

@$core.Deprecated('Use getWifiNetworksDescriptor instead')
const GetWifiNetworks$json = {
  '1': 'GetWifiNetworks',
  '2': [
    {'1': 'start_index', '3': 1, '4': 1, '5': 13, '10': 'startIndex'},
    {'1': 'end_index', '3': 2, '4': 1, '5': 13, '10': 'endIndex'},
  ],
};

/// Descriptor for `GetWifiNetworks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWifiNetworksDescriptor = $convert.base64Decode(
    'Cg9HZXRXaWZpTmV0d29ya3MSHwoLc3RhcnRfaW5kZXgYASABKA1SCnN0YXJ0SW5kZXgSGwoJZW'
    '5kX2luZGV4GAIgASgNUghlbmRJbmRleA==');

@$core.Deprecated('Use connectToSsidDescriptor instead')
const ConnectToSsid$json = {
  '1': 'ConnectToSsid',
  '2': [
    {'1': 'ssid', '3': 1, '4': 1, '5': 9, '10': 'ssid'},
    {'1': 'enc_pass', '3': 2, '4': 1, '5': 12, '10': 'encPass'},
    {'1': 'pass_nonce', '3': 3, '4': 1, '5': 12, '10': 'passNonce'},
  ],
};

/// Descriptor for `ConnectToSsid`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectToSsidDescriptor = $convert.base64Decode(
    'Cg1Db25uZWN0VG9Tc2lkEhIKBHNzaWQYASABKAlSBHNzaWQSGQoIZW5jX3Bhc3MYAiABKAxSB2'
    'VuY1Bhc3MSHQoKcGFzc19ub25jZRgDIAEoDFIJcGFzc05vbmNl');

@$core.Deprecated('Use subscriptionStatusDescriptor instead')
const SubscriptionStatus$json = {
  '1': 'SubscriptionStatus',
};

/// Descriptor for `SubscriptionStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionStatusDescriptor =
    $convert.base64Decode('ChJTdWJzY3JpcHRpb25TdGF0dXM=');

@$core.Deprecated('Use validateSubscriptionDescriptor instead')
const ValidateSubscription$json = {
  '1': 'ValidateSubscription',
};

/// Descriptor for `ValidateSubscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateSubscriptionDescriptor =
    $convert.base64Decode('ChRWYWxpZGF0ZVN1YnNjcmlwdGlvbg==');

@$core.Deprecated('Use addOfflineKeyDescriptor instead')
const AddOfflineKey$json = {
  '1': 'AddOfflineKey',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `AddOfflineKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addOfflineKeyDescriptor =
    $convert.base64Decode('Cg1BZGRPZmZsaW5lS2V5EhAKA2tleRgBIAEoCVIDa2V5');

@$core.Deprecated('Use setAnnouncementIntervalDescriptor instead')
const SetAnnouncementInterval$json = {
  '1': 'SetAnnouncementInterval',
  '2': [
    {'1': 'seconds', '3': 1, '4': 1, '5': 4, '10': 'seconds'},
  ],
};

/// Descriptor for `SetAnnouncementInterval`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAnnouncementIntervalDescriptor =
    $convert.base64Decode(
        'ChdTZXRBbm5vdW5jZW1lbnRJbnRlcnZhbBIYCgdzZWNvbmRzGAEgASgEUgdzZWNvbmRz');

@$core.Deprecated('Use clientRequestDescriptor instead')
const ClientRequest$json = {
  '1': 'ClientRequest',
  '2': [
    {
      '1': 'setup_client',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.request_client.SetupClient',
      '9': 0,
      '10': 'setupClient'
    },
    {
      '1': 'setup_with_update',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.request_client.SetupWithUpdate',
      '9': 0,
      '10': 'setupWithUpdate'
    },
    {
      '1': 'setup_runtime',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.request_client.SetupRuntime',
      '9': 0,
      '10': 'setupRuntime'
    },
    {
      '1': 'get_wifi_network_count',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.request_client.GetWifiNetworkCount',
      '9': 0,
      '10': 'getWifiNetworkCount'
    },
    {
      '1': 'get_wifi_networks',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.request_client.GetWifiNetworks',
      '9': 0,
      '10': 'getWifiNetworks'
    },
    {
      '1': 'connect_to_ssid',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.request_client.ConnectToSsid',
      '9': 0,
      '10': 'connectToSsid'
    },
    {
      '1': 'subscription_status',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.request_client.SubscriptionStatus',
      '9': 0,
      '10': 'subscriptionStatus'
    },
    {
      '1': 'validate_subscription',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.request_client.ValidateSubscription',
      '9': 0,
      '10': 'validateSubscription'
    },
    {
      '1': 'add_offline_key',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.request_client.AddOfflineKey',
      '9': 0,
      '10': 'addOfflineKey'
    },
    {
      '1': 'set_announcement_interval',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.request_client.SetAnnouncementInterval',
      '9': 0,
      '10': 'setAnnouncementInterval'
    },
  ],
  '8': [
    {'1': 'action'},
  ],
};

/// Descriptor for `ClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientRequestDescriptor = $convert.base64Decode(
    'Cg1DbGllbnRSZXF1ZXN0EkAKDHNldHVwX2NsaWVudBgBIAEoCzIbLnJlcXVlc3RfY2xpZW50Ll'
    'NldHVwQ2xpZW50SABSC3NldHVwQ2xpZW50Ek0KEXNldHVwX3dpdGhfdXBkYXRlGAIgASgLMh8u'
    'cmVxdWVzdF9jbGllbnQuU2V0dXBXaXRoVXBkYXRlSABSD3NldHVwV2l0aFVwZGF0ZRJDCg1zZX'
    'R1cF9ydW50aW1lGAMgASgLMhwucmVxdWVzdF9jbGllbnQuU2V0dXBSdW50aW1lSABSDHNldHVw'
    'UnVudGltZRJaChZnZXRfd2lmaV9uZXR3b3JrX2NvdW50GAQgASgLMiMucmVxdWVzdF9jbGllbn'
    'QuR2V0V2lmaU5ldHdvcmtDb3VudEgAUhNnZXRXaWZpTmV0d29ya0NvdW50Ek0KEWdldF93aWZp'
    'X25ldHdvcmtzGAUgASgLMh8ucmVxdWVzdF9jbGllbnQuR2V0V2lmaU5ldHdvcmtzSABSD2dldF'
    'dpZmlOZXR3b3JrcxJHCg9jb25uZWN0X3RvX3NzaWQYBiABKAsyHS5yZXF1ZXN0X2NsaWVudC5D'
    'b25uZWN0VG9Tc2lkSABSDWNvbm5lY3RUb1NzaWQSVQoTc3Vic2NyaXB0aW9uX3N0YXR1cxgHIA'
    'EoCzIiLnJlcXVlc3RfY2xpZW50LlN1YnNjcmlwdGlvblN0YXR1c0gAUhJzdWJzY3JpcHRpb25T'
    'dGF0dXMSWwoVdmFsaWRhdGVfc3Vic2NyaXB0aW9uGAggASgLMiQucmVxdWVzdF9jbGllbnQuVm'
    'FsaWRhdGVTdWJzY3JpcHRpb25IAFIUdmFsaWRhdGVTdWJzY3JpcHRpb24SRwoPYWRkX29mZmxp'
    'bmVfa2V5GAkgASgLMh0ucmVxdWVzdF9jbGllbnQuQWRkT2ZmbGluZUtleUgAUg1hZGRPZmZsaW'
    '5lS2V5EmUKGXNldF9hbm5vdW5jZW1lbnRfaW50ZXJ2YWwYCiABKAsyJy5yZXF1ZXN0X2NsaWVu'
    'dC5TZXRBbm5vdW5jZW1lbnRJbnRlcnZhbEgAUhdzZXRBbm5vdW5jZW1lbnRJbnRlcnZhbEIICg'
    'ZhY3Rpb24=');
