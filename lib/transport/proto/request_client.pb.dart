// This is a generated file - do not edit.
//
// Generated from request_client.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class SetupClient extends $pb.GeneratedMessage {
  factory SetupClient({
    $core.String? dbPath,
    $core.String? name,
    $core.String? id,
  }) {
    final result = create();
    if (dbPath != null) result.dbPath = dbPath;
    if (name != null) result.name = name;
    if (id != null) result.id = id;
    return result;
  }

  SetupClient._();

  factory SetupClient.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetupClient.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetupClient',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbPath')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupClient clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupClient copyWith(void Function(SetupClient) updates) =>
      super.copyWith((message) => updates(message as SetupClient))
          as SetupClient;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetupClient create() => SetupClient._();
  @$core.override
  SetupClient createEmptyInstance() => create();
  static $pb.PbList<SetupClient> createRepeated() => $pb.PbList<SetupClient>();
  @$core.pragma('dart2js:noInline')
  static SetupClient getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetupClient>(create);
  static SetupClient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbPath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDbPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbPath() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(4)
  set id($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(4)
  void clearId() => $_clearField(4);
}

class SetupWithUpdate extends $pb.GeneratedMessage {
  factory SetupWithUpdate({
    $core.String? dbPath,
    $core.String? songDir,
  }) {
    final result = create();
    if (dbPath != null) result.dbPath = dbPath;
    if (songDir != null) result.songDir = songDir;
    return result;
  }

  SetupWithUpdate._();

  factory SetupWithUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetupWithUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetupWithUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dbPath')
    ..aOS(2, _omitFieldNames ? '' : 'songDir')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupWithUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupWithUpdate copyWith(void Function(SetupWithUpdate) updates) =>
      super.copyWith((message) => updates(message as SetupWithUpdate))
          as SetupWithUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetupWithUpdate create() => SetupWithUpdate._();
  @$core.override
  SetupWithUpdate createEmptyInstance() => create();
  static $pb.PbList<SetupWithUpdate> createRepeated() =>
      $pb.PbList<SetupWithUpdate>();
  @$core.pragma('dart2js:noInline')
  static SetupWithUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetupWithUpdate>(create);
  static SetupWithUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dbPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set dbPath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDbPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearDbPath() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get songDir => $_getSZ(1);
  @$pb.TagNumber(2)
  set songDir($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSongDir() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongDir() => $_clearField(2);
}

class SetupRuntime extends $pb.GeneratedMessage {
  factory SetupRuntime({
    $core.String? songDir,
    $core.String? dbPath,
    $core.String? updateDir,
    $core.String? updatePackage,
  }) {
    final result = create();
    if (songDir != null) result.songDir = songDir;
    if (dbPath != null) result.dbPath = dbPath;
    if (updateDir != null) result.updateDir = updateDir;
    if (updatePackage != null) result.updatePackage = updatePackage;
    return result;
  }

  SetupRuntime._();

  factory SetupRuntime.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetupRuntime.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetupRuntime',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'songDir')
    ..aOS(2, _omitFieldNames ? '' : 'dbPath')
    ..aOS(3, _omitFieldNames ? '' : 'updateDir')
    ..aOS(4, _omitFieldNames ? '' : 'updatePackage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupRuntime clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupRuntime copyWith(void Function(SetupRuntime) updates) =>
      super.copyWith((message) => updates(message as SetupRuntime))
          as SetupRuntime;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetupRuntime create() => SetupRuntime._();
  @$core.override
  SetupRuntime createEmptyInstance() => create();
  static $pb.PbList<SetupRuntime> createRepeated() =>
      $pb.PbList<SetupRuntime>();
  @$core.pragma('dart2js:noInline')
  static SetupRuntime getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetupRuntime>(create);
  static SetupRuntime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get songDir => $_getSZ(0);
  @$pb.TagNumber(1)
  set songDir($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongDir() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongDir() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dbPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set dbPath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDbPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearDbPath() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get updateDir => $_getSZ(2);
  @$pb.TagNumber(3)
  set updateDir($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateDir() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateDir() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get updatePackage => $_getSZ(3);
  @$pb.TagNumber(4)
  set updatePackage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdatePackage() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatePackage() => $_clearField(4);
}

class GetWifiNetworkCount extends $pb.GeneratedMessage {
  factory GetWifiNetworkCount() => create();

  GetWifiNetworkCount._();

  factory GetWifiNetworkCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWifiNetworkCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWifiNetworkCount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWifiNetworkCount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWifiNetworkCount copyWith(void Function(GetWifiNetworkCount) updates) =>
      super.copyWith((message) => updates(message as GetWifiNetworkCount))
          as GetWifiNetworkCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWifiNetworkCount create() => GetWifiNetworkCount._();
  @$core.override
  GetWifiNetworkCount createEmptyInstance() => create();
  static $pb.PbList<GetWifiNetworkCount> createRepeated() =>
      $pb.PbList<GetWifiNetworkCount>();
  @$core.pragma('dart2js:noInline')
  static GetWifiNetworkCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWifiNetworkCount>(create);
  static GetWifiNetworkCount? _defaultInstance;
}

class GetWifiNetworks extends $pb.GeneratedMessage {
  factory GetWifiNetworks({
    $core.int? startIndex,
    $core.int? endIndex,
  }) {
    final result = create();
    if (startIndex != null) result.startIndex = startIndex;
    if (endIndex != null) result.endIndex = endIndex;
    return result;
  }

  GetWifiNetworks._();

  factory GetWifiNetworks.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWifiNetworks.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWifiNetworks',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'startIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'endIndex', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWifiNetworks clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWifiNetworks copyWith(void Function(GetWifiNetworks) updates) =>
      super.copyWith((message) => updates(message as GetWifiNetworks))
          as GetWifiNetworks;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWifiNetworks create() => GetWifiNetworks._();
  @$core.override
  GetWifiNetworks createEmptyInstance() => create();
  static $pb.PbList<GetWifiNetworks> createRepeated() =>
      $pb.PbList<GetWifiNetworks>();
  @$core.pragma('dart2js:noInline')
  static GetWifiNetworks getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWifiNetworks>(create);
  static GetWifiNetworks? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get startIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set startIndex($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get endIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set endIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndIndex() => $_clearField(2);
}

class ConnectToSsid extends $pb.GeneratedMessage {
  factory ConnectToSsid({
    $core.String? ssid,
    $core.List<$core.int>? encPass,
    $core.List<$core.int>? passNonce,
  }) {
    final result = create();
    if (ssid != null) result.ssid = ssid;
    if (encPass != null) result.encPass = encPass;
    if (passNonce != null) result.passNonce = passNonce;
    return result;
  }

  ConnectToSsid._();

  factory ConnectToSsid.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectToSsid.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectToSsid',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ssid')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encPass', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'passNonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectToSsid clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectToSsid copyWith(void Function(ConnectToSsid) updates) =>
      super.copyWith((message) => updates(message as ConnectToSsid))
          as ConnectToSsid;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectToSsid create() => ConnectToSsid._();
  @$core.override
  ConnectToSsid createEmptyInstance() => create();
  static $pb.PbList<ConnectToSsid> createRepeated() =>
      $pb.PbList<ConnectToSsid>();
  @$core.pragma('dart2js:noInline')
  static ConnectToSsid getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectToSsid>(create);
  static ConnectToSsid? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ssid => $_getSZ(0);
  @$pb.TagNumber(1)
  set ssid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get encPass => $_getN(1);
  @$pb.TagNumber(2)
  set encPass($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEncPass() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncPass() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get passNonce => $_getN(2);
  @$pb.TagNumber(3)
  set passNonce($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassNonce() => $_clearField(3);
}

class SubscriptionStatus extends $pb.GeneratedMessage {
  factory SubscriptionStatus() => create();

  SubscriptionStatus._();

  factory SubscriptionStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscriptionStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionStatus copyWith(void Function(SubscriptionStatus) updates) =>
      super.copyWith((message) => updates(message as SubscriptionStatus))
          as SubscriptionStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionStatus create() => SubscriptionStatus._();
  @$core.override
  SubscriptionStatus createEmptyInstance() => create();
  static $pb.PbList<SubscriptionStatus> createRepeated() =>
      $pb.PbList<SubscriptionStatus>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionStatus>(create);
  static SubscriptionStatus? _defaultInstance;
}

class ValidateSubscription extends $pb.GeneratedMessage {
  factory ValidateSubscription() => create();

  ValidateSubscription._();

  factory ValidateSubscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateSubscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateSubscription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateSubscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateSubscription copyWith(void Function(ValidateSubscription) updates) =>
      super.copyWith((message) => updates(message as ValidateSubscription))
          as ValidateSubscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateSubscription create() => ValidateSubscription._();
  @$core.override
  ValidateSubscription createEmptyInstance() => create();
  static $pb.PbList<ValidateSubscription> createRepeated() =>
      $pb.PbList<ValidateSubscription>();
  @$core.pragma('dart2js:noInline')
  static ValidateSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateSubscription>(create);
  static ValidateSubscription? _defaultInstance;
}

class AddOfflineKey extends $pb.GeneratedMessage {
  factory AddOfflineKey({
    $core.String? key,
  }) {
    final result = create();
    if (key != null) result.key = key;
    return result;
  }

  AddOfflineKey._();

  factory AddOfflineKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddOfflineKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddOfflineKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddOfflineKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddOfflineKey copyWith(void Function(AddOfflineKey) updates) =>
      super.copyWith((message) => updates(message as AddOfflineKey))
          as AddOfflineKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddOfflineKey create() => AddOfflineKey._();
  @$core.override
  AddOfflineKey createEmptyInstance() => create();
  static $pb.PbList<AddOfflineKey> createRepeated() =>
      $pb.PbList<AddOfflineKey>();
  @$core.pragma('dart2js:noInline')
  static AddOfflineKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddOfflineKey>(create);
  static AddOfflineKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);
}

class SetAnnouncementInterval extends $pb.GeneratedMessage {
  factory SetAnnouncementInterval({
    $fixnum.Int64? seconds,
  }) {
    final result = create();
    if (seconds != null) result.seconds = seconds;
    return result;
  }

  SetAnnouncementInterval._();

  factory SetAnnouncementInterval.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetAnnouncementInterval.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetAnnouncementInterval',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'seconds', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetAnnouncementInterval clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetAnnouncementInterval copyWith(
          void Function(SetAnnouncementInterval) updates) =>
      super.copyWith((message) => updates(message as SetAnnouncementInterval))
          as SetAnnouncementInterval;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetAnnouncementInterval create() => SetAnnouncementInterval._();
  @$core.override
  SetAnnouncementInterval createEmptyInstance() => create();
  static $pb.PbList<SetAnnouncementInterval> createRepeated() =>
      $pb.PbList<SetAnnouncementInterval>();
  @$core.pragma('dart2js:noInline')
  static SetAnnouncementInterval getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetAnnouncementInterval>(create);
  static SetAnnouncementInterval? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seconds => $_getI64(0);
  @$pb.TagNumber(1)
  set seconds($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeconds() => $_clearField(1);
}

enum ClientRequest_Action {
  setupClient,
  setupWithUpdate,
  setupRuntime,
  getWifiNetworkCount,
  getWifiNetworks,
  connectToSsid,
  subscriptionStatus,
  validateSubscription,
  addOfflineKey,
  setAnnouncementInterval,
  notSet
}

class ClientRequest extends $pb.GeneratedMessage {
  factory ClientRequest({
    SetupClient? setupClient,
    SetupWithUpdate? setupWithUpdate,
    SetupRuntime? setupRuntime,
    GetWifiNetworkCount? getWifiNetworkCount,
    GetWifiNetworks? getWifiNetworks,
    ConnectToSsid? connectToSsid,
    SubscriptionStatus? subscriptionStatus,
    ValidateSubscription? validateSubscription,
    AddOfflineKey? addOfflineKey,
    SetAnnouncementInterval? setAnnouncementInterval,
  }) {
    final result = create();
    if (setupClient != null) result.setupClient = setupClient;
    if (setupWithUpdate != null) result.setupWithUpdate = setupWithUpdate;
    if (setupRuntime != null) result.setupRuntime = setupRuntime;
    if (getWifiNetworkCount != null)
      result.getWifiNetworkCount = getWifiNetworkCount;
    if (getWifiNetworks != null) result.getWifiNetworks = getWifiNetworks;
    if (connectToSsid != null) result.connectToSsid = connectToSsid;
    if (subscriptionStatus != null)
      result.subscriptionStatus = subscriptionStatus;
    if (validateSubscription != null)
      result.validateSubscription = validateSubscription;
    if (addOfflineKey != null) result.addOfflineKey = addOfflineKey;
    if (setAnnouncementInterval != null)
      result.setAnnouncementInterval = setAnnouncementInterval;
    return result;
  }

  ClientRequest._();

  factory ClientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ClientRequest_Action>
      _ClientRequest_ActionByTag = {
    1: ClientRequest_Action.setupClient,
    2: ClientRequest_Action.setupWithUpdate,
    3: ClientRequest_Action.setupRuntime,
    4: ClientRequest_Action.getWifiNetworkCount,
    5: ClientRequest_Action.getWifiNetworks,
    6: ClientRequest_Action.connectToSsid,
    7: ClientRequest_Action.subscriptionStatus,
    8: ClientRequest_Action.validateSubscription,
    9: ClientRequest_Action.addOfflineKey,
    10: ClientRequest_Action.setAnnouncementInterval,
    0: ClientRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_client'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    ..aOM<SetupClient>(1, _omitFieldNames ? '' : 'setupClient',
        subBuilder: SetupClient.create)
    ..aOM<SetupWithUpdate>(2, _omitFieldNames ? '' : 'setupWithUpdate',
        subBuilder: SetupWithUpdate.create)
    ..aOM<SetupRuntime>(3, _omitFieldNames ? '' : 'setupRuntime',
        subBuilder: SetupRuntime.create)
    ..aOM<GetWifiNetworkCount>(4, _omitFieldNames ? '' : 'getWifiNetworkCount',
        subBuilder: GetWifiNetworkCount.create)
    ..aOM<GetWifiNetworks>(5, _omitFieldNames ? '' : 'getWifiNetworks',
        subBuilder: GetWifiNetworks.create)
    ..aOM<ConnectToSsid>(6, _omitFieldNames ? '' : 'connectToSsid',
        subBuilder: ConnectToSsid.create)
    ..aOM<SubscriptionStatus>(7, _omitFieldNames ? '' : 'subscriptionStatus',
        subBuilder: SubscriptionStatus.create)
    ..aOM<ValidateSubscription>(
        8, _omitFieldNames ? '' : 'validateSubscription',
        subBuilder: ValidateSubscription.create)
    ..aOM<AddOfflineKey>(9, _omitFieldNames ? '' : 'addOfflineKey',
        subBuilder: AddOfflineKey.create)
    ..aOM<SetAnnouncementInterval>(
        10, _omitFieldNames ? '' : 'setAnnouncementInterval',
        subBuilder: SetAnnouncementInterval.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClientRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClientRequest copyWith(void Function(ClientRequest) updates) =>
      super.copyWith((message) => updates(message as ClientRequest))
          as ClientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientRequest create() => ClientRequest._();
  @$core.override
  ClientRequest createEmptyInstance() => create();
  static $pb.PbList<ClientRequest> createRepeated() =>
      $pb.PbList<ClientRequest>();
  @$core.pragma('dart2js:noInline')
  static ClientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientRequest>(create);
  static ClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  ClientRequest_Action whichAction() =>
      _ClientRequest_ActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SetupClient get setupClient => $_getN(0);
  @$pb.TagNumber(1)
  set setupClient(SetupClient value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSetupClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetupClient() => $_clearField(1);
  @$pb.TagNumber(1)
  SetupClient ensureSetupClient() => $_ensure(0);

  @$pb.TagNumber(2)
  SetupWithUpdate get setupWithUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set setupWithUpdate(SetupWithUpdate value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSetupWithUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearSetupWithUpdate() => $_clearField(2);
  @$pb.TagNumber(2)
  SetupWithUpdate ensureSetupWithUpdate() => $_ensure(1);

  @$pb.TagNumber(3)
  SetupRuntime get setupRuntime => $_getN(2);
  @$pb.TagNumber(3)
  set setupRuntime(SetupRuntime value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSetupRuntime() => $_has(2);
  @$pb.TagNumber(3)
  void clearSetupRuntime() => $_clearField(3);
  @$pb.TagNumber(3)
  SetupRuntime ensureSetupRuntime() => $_ensure(2);

  @$pb.TagNumber(4)
  GetWifiNetworkCount get getWifiNetworkCount => $_getN(3);
  @$pb.TagNumber(4)
  set getWifiNetworkCount(GetWifiNetworkCount value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGetWifiNetworkCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearGetWifiNetworkCount() => $_clearField(4);
  @$pb.TagNumber(4)
  GetWifiNetworkCount ensureGetWifiNetworkCount() => $_ensure(3);

  @$pb.TagNumber(5)
  GetWifiNetworks get getWifiNetworks => $_getN(4);
  @$pb.TagNumber(5)
  set getWifiNetworks(GetWifiNetworks value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGetWifiNetworks() => $_has(4);
  @$pb.TagNumber(5)
  void clearGetWifiNetworks() => $_clearField(5);
  @$pb.TagNumber(5)
  GetWifiNetworks ensureGetWifiNetworks() => $_ensure(4);

  @$pb.TagNumber(6)
  ConnectToSsid get connectToSsid => $_getN(5);
  @$pb.TagNumber(6)
  set connectToSsid(ConnectToSsid value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasConnectToSsid() => $_has(5);
  @$pb.TagNumber(6)
  void clearConnectToSsid() => $_clearField(6);
  @$pb.TagNumber(6)
  ConnectToSsid ensureConnectToSsid() => $_ensure(5);

  @$pb.TagNumber(7)
  SubscriptionStatus get subscriptionStatus => $_getN(6);
  @$pb.TagNumber(7)
  set subscriptionStatus(SubscriptionStatus value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasSubscriptionStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubscriptionStatus() => $_clearField(7);
  @$pb.TagNumber(7)
  SubscriptionStatus ensureSubscriptionStatus() => $_ensure(6);

  @$pb.TagNumber(8)
  ValidateSubscription get validateSubscription => $_getN(7);
  @$pb.TagNumber(8)
  set validateSubscription(ValidateSubscription value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasValidateSubscription() => $_has(7);
  @$pb.TagNumber(8)
  void clearValidateSubscription() => $_clearField(8);
  @$pb.TagNumber(8)
  ValidateSubscription ensureValidateSubscription() => $_ensure(7);

  @$pb.TagNumber(9)
  AddOfflineKey get addOfflineKey => $_getN(8);
  @$pb.TagNumber(9)
  set addOfflineKey(AddOfflineKey value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAddOfflineKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearAddOfflineKey() => $_clearField(9);
  @$pb.TagNumber(9)
  AddOfflineKey ensureAddOfflineKey() => $_ensure(8);

  @$pb.TagNumber(10)
  SetAnnouncementInterval get setAnnouncementInterval => $_getN(9);
  @$pb.TagNumber(10)
  set setAnnouncementInterval(SetAnnouncementInterval value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSetAnnouncementInterval() => $_has(9);
  @$pb.TagNumber(10)
  void clearSetAnnouncementInterval() => $_clearField(10);
  @$pb.TagNumber(10)
  SetAnnouncementInterval ensureSetAnnouncementInterval() => $_ensure(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
