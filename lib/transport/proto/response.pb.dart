// This is a generated file - do not edit.
//
// Generated from response.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'error.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $2;
import 'remote.pb.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UpdateProgressEvent extends $pb.GeneratedMessage {
  factory UpdateProgressEvent({
    $core.int? value,
    $core.double? progress,
    $core.String? message,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (progress != null) result.progress = progress;
    if (message != null) result.message = message;
    return result;
  }

  UpdateProgressEvent._();

  factory UpdateProgressEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProgressEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProgressEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'response'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'value', fieldType: $pb.PbFieldType.OU3)
    ..aD(2, _omitFieldNames ? '' : 'progress', fieldType: $pb.PbFieldType.OF)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProgressEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProgressEvent copyWith(void Function(UpdateProgressEvent) updates) =>
      super.copyWith((message) => updates(message as UpdateProgressEvent))
          as UpdateProgressEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProgressEvent create() => UpdateProgressEvent._();
  @$core.override
  UpdateProgressEvent createEmptyInstance() => create();
  static $pb.PbList<UpdateProgressEvent> createRepeated() =>
      $pb.PbList<UpdateProgressEvent>();
  @$core.pragma('dart2js:noInline')
  static UpdateProgressEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProgressEvent>(create);
  static UpdateProgressEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get progress => $_getN(1);
  @$pb.TagNumber(2)
  set progress($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearProgress() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class WifiNetworkList extends $pb.GeneratedMessage {
  factory WifiNetworkList({
    $core.Iterable<$core.String>? items,
    $core.int? activeIndex,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (activeIndex != null) result.activeIndex = activeIndex;
    return result;
  }

  WifiNetworkList._();

  factory WifiNetworkList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiNetworkList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiNetworkList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'response'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'items')
    ..aI(2, _omitFieldNames ? '' : 'activeIndex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiNetworkList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiNetworkList copyWith(void Function(WifiNetworkList) updates) =>
      super.copyWith((message) => updates(message as WifiNetworkList))
          as WifiNetworkList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiNetworkList create() => WifiNetworkList._();
  @$core.override
  WifiNetworkList createEmptyInstance() => create();
  static $pb.PbList<WifiNetworkList> createRepeated() =>
      $pb.PbList<WifiNetworkList>();
  @$core.pragma('dart2js:noInline')
  static WifiNetworkList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiNetworkList>(create);
  static WifiNetworkList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get activeIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set activeIndex($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActiveIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveIndex() => $_clearField(2);
}

enum Response_Response {
  error,
  ok,
  bool_3,
  uint32,
  uint64,
  int32,
  int64,
  float,
  double_9,
  date,
  presetInfo,
  schedule,
  scheduleRotations,
  selection,
  presetList,
  songList,
  updateProgressEvent,
  wifiNetworkList,
  notSet
}

class Response extends $pb.GeneratedMessage {
  factory Response({
    $0.Error? error,
    $1.Empty? ok,
    $core.bool? bool_3,
    $core.int? uint32,
    $fixnum.Int64? uint64,
    $core.int? int32,
    $fixnum.Int64? int64,
    $core.double? float,
    $core.double? double_9,
    $2.Timestamp? date,
    $3.PresetInfo? presetInfo,
    $3.Schedule? schedule,
    $3.ScheduleRotationList? scheduleRotations,
    $3.Selection? selection,
    $3.PresetList? presetList,
    $3.SongList? songList,
    UpdateProgressEvent? updateProgressEvent,
    WifiNetworkList? wifiNetworkList,
  }) {
    final result = create();
    if (error != null) result.error = error;
    if (ok != null) result.ok = ok;
    if (bool_3 != null) result.bool_3 = bool_3;
    if (uint32 != null) result.uint32 = uint32;
    if (uint64 != null) result.uint64 = uint64;
    if (int32 != null) result.int32 = int32;
    if (int64 != null) result.int64 = int64;
    if (float != null) result.float = float;
    if (double_9 != null) result.double_9 = double_9;
    if (date != null) result.date = date;
    if (presetInfo != null) result.presetInfo = presetInfo;
    if (schedule != null) result.schedule = schedule;
    if (scheduleRotations != null) result.scheduleRotations = scheduleRotations;
    if (selection != null) result.selection = selection;
    if (presetList != null) result.presetList = presetList;
    if (songList != null) result.songList = songList;
    if (updateProgressEvent != null)
      result.updateProgressEvent = updateProgressEvent;
    if (wifiNetworkList != null) result.wifiNetworkList = wifiNetworkList;
    return result;
  }

  Response._();

  factory Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Response_Response> _Response_ResponseByTag =
      {
    1: Response_Response.error,
    2: Response_Response.ok,
    3: Response_Response.bool_3,
    4: Response_Response.uint32,
    5: Response_Response.uint64,
    6: Response_Response.int32,
    7: Response_Response.int64,
    8: Response_Response.float,
    9: Response_Response.double_9,
    10: Response_Response.date,
    11: Response_Response.presetInfo,
    12: Response_Response.schedule,
    13: Response_Response.scheduleRotations,
    14: Response_Response.selection,
    15: Response_Response.presetList,
    16: Response_Response.songList,
    17: Response_Response.updateProgressEvent,
    18: Response_Response.wifiNetworkList,
    0: Response_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'response'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18])
    ..aOM<$0.Error>(1, _omitFieldNames ? '' : 'error',
        subBuilder: $0.Error.create)
    ..aOM<$1.Empty>(2, _omitFieldNames ? '' : 'ok', subBuilder: $1.Empty.create)
    ..aOB(3, _omitFieldNames ? '' : 'bool')
    ..aI(4, _omitFieldNames ? '' : 'uint32', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'uint64', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'int32')
    ..aInt64(7, _omitFieldNames ? '' : 'int64')
    ..aD(8, _omitFieldNames ? '' : 'float', fieldType: $pb.PbFieldType.OF)
    ..aD(9, _omitFieldNames ? '' : 'double')
    ..aOM<$2.Timestamp>(10, _omitFieldNames ? '' : 'date',
        subBuilder: $2.Timestamp.create)
    ..aOM<$3.PresetInfo>(11, _omitFieldNames ? '' : 'presetInfo',
        subBuilder: $3.PresetInfo.create)
    ..aOM<$3.Schedule>(12, _omitFieldNames ? '' : 'schedule',
        subBuilder: $3.Schedule.create)
    ..aOM<$3.ScheduleRotationList>(
        13, _omitFieldNames ? '' : 'scheduleRotations',
        subBuilder: $3.ScheduleRotationList.create)
    ..aOM<$3.Selection>(14, _omitFieldNames ? '' : 'selection',
        subBuilder: $3.Selection.create)
    ..aOM<$3.PresetList>(15, _omitFieldNames ? '' : 'presetList',
        subBuilder: $3.PresetList.create)
    ..aOM<$3.SongList>(16, _omitFieldNames ? '' : 'songList',
        subBuilder: $3.SongList.create)
    ..aOM<UpdateProgressEvent>(17, _omitFieldNames ? '' : 'updateProgressEvent',
        subBuilder: UpdateProgressEvent.create)
    ..aOM<WifiNetworkList>(18, _omitFieldNames ? '' : 'wifiNetworkList',
        subBuilder: WifiNetworkList.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Response copyWith(void Function(Response) updates) =>
      super.copyWith((message) => updates(message as Response)) as Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  @$core.override
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

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
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  Response_Response whichResponse() =>
      _Response_ResponseByTag[$_whichOneof(0)]!;
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
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  void clearResponse() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.Error get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($0.Error value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Error ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Empty get ok => $_getN(1);
  @$pb.TagNumber(2)
  set ok($1.Empty value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureOk() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get bool_3 => $_getBF(2);
  @$pb.TagNumber(3)
  set bool_3($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBool_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearBool_3() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get uint32 => $_getIZ(3);
  @$pb.TagNumber(4)
  set uint32($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUint32() => $_has(3);
  @$pb.TagNumber(4)
  void clearUint32() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get uint64 => $_getI64(4);
  @$pb.TagNumber(5)
  set uint64($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUint64() => $_has(4);
  @$pb.TagNumber(5)
  void clearUint64() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get int32 => $_getIZ(5);
  @$pb.TagNumber(6)
  set int32($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInt32() => $_has(5);
  @$pb.TagNumber(6)
  void clearInt32() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get int64 => $_getI64(6);
  @$pb.TagNumber(7)
  set int64($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasInt64() => $_has(6);
  @$pb.TagNumber(7)
  void clearInt64() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get float => $_getN(7);
  @$pb.TagNumber(8)
  set float($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFloat() => $_has(7);
  @$pb.TagNumber(8)
  void clearFloat() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get double_9 => $_getN(8);
  @$pb.TagNumber(9)
  set double_9($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDouble_9() => $_has(8);
  @$pb.TagNumber(9)
  void clearDouble_9() => $_clearField(9);

  @$pb.TagNumber(10)
  $2.Timestamp get date => $_getN(9);
  @$pb.TagNumber(10)
  set date($2.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasDate() => $_has(9);
  @$pb.TagNumber(10)
  void clearDate() => $_clearField(10);
  @$pb.TagNumber(10)
  $2.Timestamp ensureDate() => $_ensure(9);

  @$pb.TagNumber(11)
  $3.PresetInfo get presetInfo => $_getN(10);
  @$pb.TagNumber(11)
  set presetInfo($3.PresetInfo value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPresetInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearPresetInfo() => $_clearField(11);
  @$pb.TagNumber(11)
  $3.PresetInfo ensurePresetInfo() => $_ensure(10);

  @$pb.TagNumber(12)
  $3.Schedule get schedule => $_getN(11);
  @$pb.TagNumber(12)
  set schedule($3.Schedule value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasSchedule() => $_has(11);
  @$pb.TagNumber(12)
  void clearSchedule() => $_clearField(12);
  @$pb.TagNumber(12)
  $3.Schedule ensureSchedule() => $_ensure(11);

  @$pb.TagNumber(13)
  $3.ScheduleRotationList get scheduleRotations => $_getN(12);
  @$pb.TagNumber(13)
  set scheduleRotations($3.ScheduleRotationList value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasScheduleRotations() => $_has(12);
  @$pb.TagNumber(13)
  void clearScheduleRotations() => $_clearField(13);
  @$pb.TagNumber(13)
  $3.ScheduleRotationList ensureScheduleRotations() => $_ensure(12);

  @$pb.TagNumber(14)
  $3.Selection get selection => $_getN(13);
  @$pb.TagNumber(14)
  set selection($3.Selection value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasSelection() => $_has(13);
  @$pb.TagNumber(14)
  void clearSelection() => $_clearField(14);
  @$pb.TagNumber(14)
  $3.Selection ensureSelection() => $_ensure(13);

  @$pb.TagNumber(15)
  $3.PresetList get presetList => $_getN(14);
  @$pb.TagNumber(15)
  set presetList($3.PresetList value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasPresetList() => $_has(14);
  @$pb.TagNumber(15)
  void clearPresetList() => $_clearField(15);
  @$pb.TagNumber(15)
  $3.PresetList ensurePresetList() => $_ensure(14);

  @$pb.TagNumber(16)
  $3.SongList get songList => $_getN(15);
  @$pb.TagNumber(16)
  set songList($3.SongList value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasSongList() => $_has(15);
  @$pb.TagNumber(16)
  void clearSongList() => $_clearField(16);
  @$pb.TagNumber(16)
  $3.SongList ensureSongList() => $_ensure(15);

  @$pb.TagNumber(17)
  UpdateProgressEvent get updateProgressEvent => $_getN(16);
  @$pb.TagNumber(17)
  set updateProgressEvent(UpdateProgressEvent value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasUpdateProgressEvent() => $_has(16);
  @$pb.TagNumber(17)
  void clearUpdateProgressEvent() => $_clearField(17);
  @$pb.TagNumber(17)
  UpdateProgressEvent ensureUpdateProgressEvent() => $_ensure(16);

  @$pb.TagNumber(18)
  WifiNetworkList get wifiNetworkList => $_getN(17);
  @$pb.TagNumber(18)
  set wifiNetworkList(WifiNetworkList value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasWifiNetworkList() => $_has(17);
  @$pb.TagNumber(18)
  void clearWifiNetworkList() => $_clearField(18);
  @$pb.TagNumber(18)
  WifiNetworkList ensureWifiNetworkList() => $_ensure(17);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
