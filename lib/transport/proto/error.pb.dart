// This is a generated file - do not edit.
//
// Generated from error.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'error.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'error.pbenum.dart';

class GenericError extends $pb.GeneratedMessage {
  factory GenericError({
    $core.String? title,
    $core.String? message,
    ErrorType? type,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (message != null) result.message = message;
    if (type != null) result.type = type;
    return result;
  }

  GenericError._();

  factory GenericError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenericError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenericError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'error'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aE<ErrorType>(3, _omitFieldNames ? '' : 'type',
        enumValues: ErrorType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenericError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenericError copyWith(void Function(GenericError) updates) =>
      super.copyWith((message) => updates(message as GenericError))
          as GenericError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenericError create() => GenericError._();
  @$core.override
  GenericError createEmptyInstance() => create();
  static $pb.PbList<GenericError> createRepeated() =>
      $pb.PbList<GenericError>();
  @$core.pragma('dart2js:noInline')
  static GenericError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenericError>(create);
  static GenericError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  ErrorType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ErrorType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);
}

class SetupError extends $pb.GeneratedMessage {
  factory SetupError({
    SetupErrorType? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  SetupError._();

  factory SetupError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetupError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetupError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'error'),
      createEmptyInstance: create)
    ..aE<SetupErrorType>(1, _omitFieldNames ? '' : 'code',
        enumValues: SetupErrorType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetupError copyWith(void Function(SetupError) updates) =>
      super.copyWith((message) => updates(message as SetupError)) as SetupError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetupError create() => SetupError._();
  @$core.override
  SetupError createEmptyInstance() => create();
  static $pb.PbList<SetupError> createRepeated() => $pb.PbList<SetupError>();
  @$core.pragma('dart2js:noInline')
  static SetupError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetupError>(create);
  static SetupError? _defaultInstance;

  @$pb.TagNumber(1)
  SetupErrorType get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(SetupErrorType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class SubscriptionExpiredError extends $pb.GeneratedMessage {
  factory SubscriptionExpiredError({
    $core.bool? checked,
  }) {
    final result = create();
    if (checked != null) result.checked = checked;
    return result;
  }

  SubscriptionExpiredError._();

  factory SubscriptionExpiredError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscriptionExpiredError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionExpiredError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'error'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'checked')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionExpiredError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionExpiredError copyWith(
          void Function(SubscriptionExpiredError) updates) =>
      super.copyWith((message) => updates(message as SubscriptionExpiredError))
          as SubscriptionExpiredError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionExpiredError create() => SubscriptionExpiredError._();
  @$core.override
  SubscriptionExpiredError createEmptyInstance() => create();
  static $pb.PbList<SubscriptionExpiredError> createRepeated() =>
      $pb.PbList<SubscriptionExpiredError>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionExpiredError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionExpiredError>(create);
  static SubscriptionExpiredError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get checked => $_getBF(0);
  @$pb.TagNumber(1)
  set checked($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChecked() => $_has(0);
  @$pb.TagNumber(1)
  void clearChecked() => $_clearField(1);
}

class SecurityError extends $pb.GeneratedMessage {
  factory SecurityError() => create();

  SecurityError._();

  factory SecurityError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecurityError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecurityError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'error'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecurityError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecurityError copyWith(void Function(SecurityError) updates) =>
      super.copyWith((message) => updates(message as SecurityError))
          as SecurityError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecurityError create() => SecurityError._();
  @$core.override
  SecurityError createEmptyInstance() => create();
  static $pb.PbList<SecurityError> createRepeated() =>
      $pb.PbList<SecurityError>();
  @$core.pragma('dart2js:noInline')
  static SecurityError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SecurityError>(create);
  static SecurityError? _defaultInstance;
}

enum Error_Error { generic, setup, subscriptionExpired, security, notSet }

class Error extends $pb.GeneratedMessage {
  factory Error({
    GenericError? generic,
    SetupError? setup,
    SubscriptionExpiredError? subscriptionExpired,
    SecurityError? security,
  }) {
    final result = create();
    if (generic != null) result.generic = generic;
    if (setup != null) result.setup = setup;
    if (subscriptionExpired != null)
      result.subscriptionExpired = subscriptionExpired;
    if (security != null) result.security = security;
    return result;
  }

  Error._();

  factory Error.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Error.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Error_Error> _Error_ErrorByTag = {
    1: Error_Error.generic,
    2: Error_Error.setup,
    3: Error_Error.subscriptionExpired,
    4: Error_Error.security,
    0: Error_Error.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Error',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'error'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<GenericError>(1, _omitFieldNames ? '' : 'generic',
        subBuilder: GenericError.create)
    ..aOM<SetupError>(2, _omitFieldNames ? '' : 'setup',
        subBuilder: SetupError.create)
    ..aOM<SubscriptionExpiredError>(
        3, _omitFieldNames ? '' : 'subscriptionExpired',
        subBuilder: SubscriptionExpiredError.create)
    ..aOM<SecurityError>(4, _omitFieldNames ? '' : 'security',
        subBuilder: SecurityError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Error clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Error copyWith(void Function(Error) updates) =>
      super.copyWith((message) => updates(message as Error)) as Error;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  @$core.override
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  Error_Error whichError() => _Error_ErrorByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearError() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GenericError get generic => $_getN(0);
  @$pb.TagNumber(1)
  set generic(GenericError value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGeneric() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeneric() => $_clearField(1);
  @$pb.TagNumber(1)
  GenericError ensureGeneric() => $_ensure(0);

  @$pb.TagNumber(2)
  SetupError get setup => $_getN(1);
  @$pb.TagNumber(2)
  set setup(SetupError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSetup() => $_has(1);
  @$pb.TagNumber(2)
  void clearSetup() => $_clearField(2);
  @$pb.TagNumber(2)
  SetupError ensureSetup() => $_ensure(1);

  @$pb.TagNumber(3)
  SubscriptionExpiredError get subscriptionExpired => $_getN(2);
  @$pb.TagNumber(3)
  set subscriptionExpired(SubscriptionExpiredError value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionExpired() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscriptionExpired() => $_clearField(3);
  @$pb.TagNumber(3)
  SubscriptionExpiredError ensureSubscriptionExpired() => $_ensure(2);

  @$pb.TagNumber(4)
  SecurityError get security => $_getN(3);
  @$pb.TagNumber(4)
  set security(SecurityError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSecurity() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecurity() => $_clearField(4);
  @$pb.TagNumber(4)
  SecurityError ensureSecurity() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
