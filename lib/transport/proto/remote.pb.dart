// This is a generated file - do not edit.
//
// Generated from remote.proto.

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

class RotationSegment extends $pb.GeneratedMessage {
  factory RotationSegment({
    $core.int? minutes,
    $core.List<$core.int>? selectionId,
    $core.Iterable<$core.int>? energies,
    $core.int? songDuration,
  }) {
    final result = create();
    if (minutes != null) result.minutes = minutes;
    if (selectionId != null) result.selectionId = selectionId;
    if (energies != null) result.energies.addAll(energies);
    if (songDuration != null) result.songDuration = songDuration;
    return result;
  }

  RotationSegment._();

  factory RotationSegment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RotationSegment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RotationSegment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'minutes', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'selectionId', $pb.PbFieldType.OY)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'energies', $pb.PbFieldType.KU3)
    ..aI(4, _omitFieldNames ? '' : 'songDuration',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RotationSegment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RotationSegment copyWith(void Function(RotationSegment) updates) =>
      super.copyWith((message) => updates(message as RotationSegment))
          as RotationSegment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RotationSegment create() => RotationSegment._();
  @$core.override
  RotationSegment createEmptyInstance() => create();
  static $pb.PbList<RotationSegment> createRepeated() =>
      $pb.PbList<RotationSegment>();
  @$core.pragma('dart2js:noInline')
  static RotationSegment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RotationSegment>(create);
  static RotationSegment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minutes => $_getIZ(0);
  @$pb.TagNumber(1)
  set minutes($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMinutes() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinutes() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get selectionId => $_getN(1);
  @$pb.TagNumber(2)
  set selectionId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSelectionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.int> get energies => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get songDuration => $_getIZ(3);
  @$pb.TagNumber(4)
  set songDuration($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSongDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearSongDuration() => $_clearField(4);
}

class ScheduleRotation extends $pb.GeneratedMessage {
  factory ScheduleRotation({
    $core.int? minute,
    $core.Iterable<RotationSegment>? segments,
  }) {
    final result = create();
    if (minute != null) result.minute = minute;
    if (segments != null) result.segments.addAll(segments);
    return result;
  }

  ScheduleRotation._();

  factory ScheduleRotation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleRotation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleRotation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'minute', fieldType: $pb.PbFieldType.OU3)
    ..pPM<RotationSegment>(2, _omitFieldNames ? '' : 'segments',
        subBuilder: RotationSegment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleRotation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleRotation copyWith(void Function(ScheduleRotation) updates) =>
      super.copyWith((message) => updates(message as ScheduleRotation))
          as ScheduleRotation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRotation create() => ScheduleRotation._();
  @$core.override
  ScheduleRotation createEmptyInstance() => create();
  static $pb.PbList<ScheduleRotation> createRepeated() =>
      $pb.PbList<ScheduleRotation>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRotation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleRotation>(create);
  static ScheduleRotation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minute => $_getIZ(0);
  @$pb.TagNumber(1)
  set minute($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMinute() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinute() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RotationSegment> get segments => $_getList(1);
}

class ScheduleRotationList extends $pb.GeneratedMessage {
  factory ScheduleRotationList({
    $core.Iterable<ScheduleRotation>? rotations,
  }) {
    final result = create();
    if (rotations != null) result.rotations.addAll(rotations);
    return result;
  }

  ScheduleRotationList._();

  factory ScheduleRotationList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleRotationList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleRotationList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..pPM<ScheduleRotation>(1, _omitFieldNames ? '' : 'rotations',
        subBuilder: ScheduleRotation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleRotationList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleRotationList copyWith(void Function(ScheduleRotationList) updates) =>
      super.copyWith((message) => updates(message as ScheduleRotationList))
          as ScheduleRotationList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRotationList create() => ScheduleRotationList._();
  @$core.override
  ScheduleRotationList createEmptyInstance() => create();
  static $pb.PbList<ScheduleRotationList> createRepeated() =>
      $pb.PbList<ScheduleRotationList>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRotationList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleRotationList>(create);
  static ScheduleRotationList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ScheduleRotation> get rotations => $_getList(0);
}

class Schedule extends $pb.GeneratedMessage {
  factory Schedule({
    $core.List<$core.int>? id,
    $core.String? name,
    $core.bool? pinned,
    $core.Iterable<$core.int>? days,
    $core.int? rotationCount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (pinned != null) result.pinned = pinned;
    if (days != null) result.days.addAll(days);
    if (rotationCount != null) result.rotationCount = rotationCount;
    return result;
  }

  Schedule._();

  factory Schedule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Schedule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Schedule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'pinned')
    ..p<$core.int>(4, _omitFieldNames ? '' : 'days', $pb.PbFieldType.KU3)
    ..aI(5, _omitFieldNames ? '' : 'rotationCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Schedule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Schedule copyWith(void Function(Schedule) updates) =>
      super.copyWith((message) => updates(message as Schedule)) as Schedule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Schedule create() => Schedule._();
  @$core.override
  Schedule createEmptyInstance() => create();
  static $pb.PbList<Schedule> createRepeated() => $pb.PbList<Schedule>();
  @$core.pragma('dart2js:noInline')
  static Schedule getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Schedule>(create);
  static Schedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get pinned => $_getBF(2);
  @$pb.TagNumber(3)
  set pinned($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPinned() => $_has(2);
  @$pb.TagNumber(3)
  void clearPinned() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.int> get days => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get rotationCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set rotationCount($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRotationCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRotationCount() => $_clearField(5);
}

class Selection extends $pb.GeneratedMessage {
  factory Selection({
    $core.List<$core.int>? id,
    $core.List<$core.int>? categoryId,
    $core.String? category,
    $core.String? name,
    $core.bool? pinned,
    $core.Iterable<$core.int>? availableEnergies,
    $core.Iterable<$core.int>? defaultEnergies,
    $core.int? defaultSongCount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (categoryId != null) result.categoryId = categoryId;
    if (category != null) result.category = category;
    if (name != null) result.name = name;
    if (pinned != null) result.pinned = pinned;
    if (availableEnergies != null)
      result.availableEnergies.addAll(availableEnergies);
    if (defaultEnergies != null) result.defaultEnergies.addAll(defaultEnergies);
    if (defaultSongCount != null) result.defaultSongCount = defaultSongCount;
    return result;
  }

  Selection._();

  factory Selection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Selection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Selection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'categoryId', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'category')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOB(5, _omitFieldNames ? '' : 'pinned')
    ..p<$core.int>(
        6, _omitFieldNames ? '' : 'availableEnergies', $pb.PbFieldType.KU3)
    ..p<$core.int>(
        7, _omitFieldNames ? '' : 'defaultEnergies', $pb.PbFieldType.KU3)
    ..aI(8, _omitFieldNames ? '' : 'defaultSongCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Selection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Selection copyWith(void Function(Selection) updates) =>
      super.copyWith((message) => updates(message as Selection)) as Selection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Selection create() => Selection._();
  @$core.override
  Selection createEmptyInstance() => create();
  static $pb.PbList<Selection> createRepeated() => $pb.PbList<Selection>();
  @$core.pragma('dart2js:noInline')
  static Selection getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Selection>(create);
  static Selection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get categoryId => $_getN(1);
  @$pb.TagNumber(2)
  set categoryId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCategoryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategoryId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get category => $_getSZ(2);
  @$pb.TagNumber(3)
  set category($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get pinned => $_getBF(4);
  @$pb.TagNumber(5)
  set pinned($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPinned() => $_has(4);
  @$pb.TagNumber(5)
  void clearPinned() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.int> get availableEnergies => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.int> get defaultEnergies => $_getList(6);

  @$pb.TagNumber(8)
  $core.int get defaultSongCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set defaultSongCount($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDefaultSongCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearDefaultSongCount() => $_clearField(8);
}

enum Preset_Kind { schedule, selection, notSet }

class Preset extends $pb.GeneratedMessage {
  factory Preset({
    Schedule? schedule,
    Selection? selection,
  }) {
    final result = create();
    if (schedule != null) result.schedule = schedule;
    if (selection != null) result.selection = selection;
    return result;
  }

  Preset._();

  factory Preset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Preset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Preset_Kind> _Preset_KindByTag = {
    1: Preset_Kind.schedule,
    2: Preset_Kind.selection,
    0: Preset_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Preset',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Schedule>(1, _omitFieldNames ? '' : 'schedule',
        subBuilder: Schedule.create)
    ..aOM<Selection>(2, _omitFieldNames ? '' : 'selection',
        subBuilder: Selection.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Preset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Preset copyWith(void Function(Preset) updates) =>
      super.copyWith((message) => updates(message as Preset)) as Preset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Preset create() => Preset._();
  @$core.override
  Preset createEmptyInstance() => create();
  static $pb.PbList<Preset> createRepeated() => $pb.PbList<Preset>();
  @$core.pragma('dart2js:noInline')
  static Preset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Preset>(create);
  static Preset? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  Preset_Kind whichKind() => _Preset_KindByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearKind() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Schedule get schedule => $_getN(0);
  @$pb.TagNumber(1)
  set schedule(Schedule value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchedule() => $_clearField(1);
  @$pb.TagNumber(1)
  Schedule ensureSchedule() => $_ensure(0);

  @$pb.TagNumber(2)
  Selection get selection => $_getN(1);
  @$pb.TagNumber(2)
  set selection(Selection value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSelection() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelection() => $_clearField(2);
  @$pb.TagNumber(2)
  Selection ensureSelection() => $_ensure(1);
}

class PresetInfo extends $pb.GeneratedMessage {
  factory PresetInfo({
    $core.int? mode,
    $core.List<$core.int>? id,
    $core.List<$core.int>? details,
  }) {
    final result = create();
    if (mode != null) result.mode = mode;
    if (id != null) result.id = id;
    if (details != null) result.details = details;
    return result;
  }

  PresetInfo._();

  factory PresetInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PresetInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PresetInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'mode', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'details', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresetInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresetInfo copyWith(void Function(PresetInfo) updates) =>
      super.copyWith((message) => updates(message as PresetInfo)) as PresetInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PresetInfo create() => PresetInfo._();
  @$core.override
  PresetInfo createEmptyInstance() => create();
  static $pb.PbList<PresetInfo> createRepeated() => $pb.PbList<PresetInfo>();
  @$core.pragma('dart2js:noInline')
  static PresetInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PresetInfo>(create);
  static PresetInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mode => $_getIZ(0);
  @$pb.TagNumber(1)
  set mode($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get details => $_getN(2);
  @$pb.TagNumber(3)
  set details($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetails() => $_clearField(3);
}

class PresetList extends $pb.GeneratedMessage {
  factory PresetList({
    $core.Iterable<Preset>? presets,
  }) {
    final result = create();
    if (presets != null) result.presets.addAll(presets);
    return result;
  }

  PresetList._();

  factory PresetList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PresetList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PresetList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..pPM<Preset>(1, _omitFieldNames ? '' : 'presets',
        subBuilder: Preset.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresetList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresetList copyWith(void Function(PresetList) updates) =>
      super.copyWith((message) => updates(message as PresetList)) as PresetList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PresetList create() => PresetList._();
  @$core.override
  PresetList createEmptyInstance() => create();
  static $pb.PbList<PresetList> createRepeated() => $pb.PbList<PresetList>();
  @$core.pragma('dart2js:noInline')
  static PresetList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PresetList>(create);
  static PresetList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Preset> get presets => $_getList(0);
}

class Song extends $pb.GeneratedMessage {
  factory Song({
    $core.List<$core.int>? id,
    $core.String? artist,
    $core.String? title,
    $core.bool? played,
    $core.bool? liked,
    $core.bool? pinned,
    $core.bool? banned,
    $fixnum.Int64? dateAddedMs,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (artist != null) result.artist = artist;
    if (title != null) result.title = title;
    if (played != null) result.played = played;
    if (liked != null) result.liked = liked;
    if (pinned != null) result.pinned = pinned;
    if (banned != null) result.banned = banned;
    if (dateAddedMs != null) result.dateAddedMs = dateAddedMs;
    return result;
  }

  Song._();

  factory Song.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Song.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Song',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'artist')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOB(4, _omitFieldNames ? '' : 'played')
    ..aOB(5, _omitFieldNames ? '' : 'liked')
    ..aOB(6, _omitFieldNames ? '' : 'pinned')
    ..aOB(7, _omitFieldNames ? '' : 'banned')
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'dateAddedMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Song clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Song copyWith(void Function(Song) updates) =>
      super.copyWith((message) => updates(message as Song)) as Song;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Song create() => Song._();
  @$core.override
  Song createEmptyInstance() => create();
  static $pb.PbList<Song> createRepeated() => $pb.PbList<Song>();
  @$core.pragma('dart2js:noInline')
  static Song getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Song>(create);
  static Song? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get artist => $_getSZ(1);
  @$pb.TagNumber(2)
  set artist($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasArtist() => $_has(1);
  @$pb.TagNumber(2)
  void clearArtist() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get played => $_getBF(3);
  @$pb.TagNumber(4)
  set played($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPlayed() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayed() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get liked => $_getBF(4);
  @$pb.TagNumber(5)
  set liked($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLiked() => $_has(4);
  @$pb.TagNumber(5)
  void clearLiked() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get pinned => $_getBF(5);
  @$pb.TagNumber(6)
  set pinned($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPinned() => $_has(5);
  @$pb.TagNumber(6)
  void clearPinned() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get banned => $_getBF(6);
  @$pb.TagNumber(7)
  set banned($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBanned() => $_has(6);
  @$pb.TagNumber(7)
  void clearBanned() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get dateAddedMs => $_getI64(7);
  @$pb.TagNumber(8)
  set dateAddedMs($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDateAddedMs() => $_has(7);
  @$pb.TagNumber(8)
  void clearDateAddedMs() => $_clearField(8);
}

class SongList extends $pb.GeneratedMessage {
  factory SongList({
    $core.Iterable<Song>? songs,
  }) {
    final result = create();
    if (songs != null) result.songs.addAll(songs);
    return result;
  }

  SongList._();

  factory SongList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SongList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SongList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..pPM<Song>(1, _omitFieldNames ? '' : 'songs', subBuilder: Song.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SongList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SongList copyWith(void Function(SongList) updates) =>
      super.copyWith((message) => updates(message as SongList)) as SongList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SongList create() => SongList._();
  @$core.override
  SongList createEmptyInstance() => create();
  static $pb.PbList<SongList> createRepeated() => $pb.PbList<SongList>();
  @$core.pragma('dart2js:noInline')
  static SongList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongList>(create);
  static SongList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Song> get songs => $_getList(0);
}

class UserState extends $pb.GeneratedMessage {
  factory UserState({
    PresetInfo? preset,
    $core.double? volume,
  }) {
    final result = create();
    if (preset != null) result.preset = preset;
    if (volume != null) result.volume = volume;
    return result;
  }

  UserState._();

  factory UserState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOM<PresetInfo>(1, _omitFieldNames ? '' : 'preset',
        subBuilder: PresetInfo.create)
    ..aD(2, _omitFieldNames ? '' : 'volume', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserState copyWith(void Function(UserState) updates) =>
      super.copyWith((message) => updates(message as UserState)) as UserState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserState create() => UserState._();
  @$core.override
  UserState createEmptyInstance() => create();
  static $pb.PbList<UserState> createRepeated() => $pb.PbList<UserState>();
  @$core.pragma('dart2js:noInline')
  static UserState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserState>(create);
  static UserState? _defaultInstance;

  @$pb.TagNumber(1)
  PresetInfo get preset => $_getN(0);
  @$pb.TagNumber(1)
  set preset(PresetInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPreset() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreset() => $_clearField(1);
  @$pb.TagNumber(1)
  PresetInfo ensurePreset() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get volume => $_getN(1);
  @$pb.TagNumber(2)
  set volume($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolume() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
