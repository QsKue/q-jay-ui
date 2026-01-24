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

class ErrorType extends $pb.ProtobufEnum {
  static const ErrorType IGNORED =
      ErrorType._(0, _omitEnumNames ? '' : 'IGNORED');
  static const ErrorType WARNING =
      ErrorType._(1, _omitEnumNames ? '' : 'WARNING');
  static const ErrorType ERROR = ErrorType._(2, _omitEnumNames ? '' : 'ERROR');
  static const ErrorType CONNECTION =
      ErrorType._(3, _omitEnumNames ? '' : 'CONNECTION');

  static const $core.List<ErrorType> values = <ErrorType>[
    IGNORED,
    WARNING,
    ERROR,
    CONNECTION,
  ];

  static final $core.List<ErrorType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ErrorType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ErrorType._(super.value, super.name);
}

class SetupErrorType extends $pb.ProtobufEnum {
  static const SetupErrorType USER_SETUP =
      SetupErrorType._(0, _omitEnumNames ? '' : 'USER_SETUP');
  static const SetupErrorType DATA_SETUP =
      SetupErrorType._(1, _omitEnumNames ? '' : 'DATA_SETUP');

  static const $core.List<SetupErrorType> values = <SetupErrorType>[
    USER_SETUP,
    DATA_SETUP,
  ];

  static final $core.List<SetupErrorType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SetupErrorType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SetupErrorType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
