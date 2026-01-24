// This is a generated file - do not edit.
//
// Generated from request_repo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetPresetCount extends $pb.GeneratedMessage {
  factory GetPresetCount() => create();

  GetPresetCount._();

  factory GetPresetCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPresetCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPresetCount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPresetCount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPresetCount copyWith(void Function(GetPresetCount) updates) =>
      super.copyWith((message) => updates(message as GetPresetCount))
          as GetPresetCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPresetCount create() => GetPresetCount._();
  @$core.override
  GetPresetCount createEmptyInstance() => create();
  static $pb.PbList<GetPresetCount> createRepeated() =>
      $pb.PbList<GetPresetCount>();
  @$core.pragma('dart2js:noInline')
  static GetPresetCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPresetCount>(create);
  static GetPresetCount? _defaultInstance;
}

class GetPresets extends $pb.GeneratedMessage {
  factory GetPresets({
    $core.int? startIndex,
    $core.int? endIndex,
  }) {
    final result = create();
    if (startIndex != null) result.startIndex = startIndex;
    if (endIndex != null) result.endIndex = endIndex;
    return result;
  }

  GetPresets._();

  factory GetPresets.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPresets.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPresets',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'startIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'endIndex', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPresets clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPresets copyWith(void Function(GetPresets) updates) =>
      super.copyWith((message) => updates(message as GetPresets)) as GetPresets;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPresets create() => GetPresets._();
  @$core.override
  GetPresets createEmptyInstance() => create();
  static $pb.PbList<GetPresets> createRepeated() => $pb.PbList<GetPresets>();
  @$core.pragma('dart2js:noInline')
  static GetPresets getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPresets>(create);
  static GetPresets? _defaultInstance;

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

class GetSchedule extends $pb.GeneratedMessage {
  factory GetSchedule({
    $core.List<$core.int>? scheduleId,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    return result;
  }

  GetSchedule._();

  factory GetSchedule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSchedule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSchedule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'scheduleId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSchedule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSchedule copyWith(void Function(GetSchedule) updates) =>
      super.copyWith((message) => updates(message as GetSchedule))
          as GetSchedule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSchedule create() => GetSchedule._();
  @$core.override
  GetSchedule createEmptyInstance() => create();
  static $pb.PbList<GetSchedule> createRepeated() => $pb.PbList<GetSchedule>();
  @$core.pragma('dart2js:noInline')
  static GetSchedule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSchedule>(create);
  static GetSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get scheduleId => $_getN(0);
  @$pb.TagNumber(1)
  set scheduleId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);
}

class GetScheduleRotations extends $pb.GeneratedMessage {
  factory GetScheduleRotations({
    $core.List<$core.int>? scheduleId,
    $core.int? startIndex,
    $core.int? endIndex,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (startIndex != null) result.startIndex = startIndex;
    if (endIndex != null) result.endIndex = endIndex;
    return result;
  }

  GetScheduleRotations._();

  factory GetScheduleRotations.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetScheduleRotations.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetScheduleRotations',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'scheduleId', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'startIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'endIndex', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetScheduleRotations clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetScheduleRotations copyWith(void Function(GetScheduleRotations) updates) =>
      super.copyWith((message) => updates(message as GetScheduleRotations))
          as GetScheduleRotations;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetScheduleRotations create() => GetScheduleRotations._();
  @$core.override
  GetScheduleRotations createEmptyInstance() => create();
  static $pb.PbList<GetScheduleRotations> createRepeated() =>
      $pb.PbList<GetScheduleRotations>();
  @$core.pragma('dart2js:noInline')
  static GetScheduleRotations getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetScheduleRotations>(create);
  static GetScheduleRotations? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get scheduleId => $_getN(0);
  @$pb.TagNumber(1)
  set scheduleId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get startIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set startIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get endIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set endIndex($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndIndex() => $_clearField(3);
}

class GetSelection extends $pb.GeneratedMessage {
  factory GetSelection({
    $core.List<$core.int>? selectionId,
  }) {
    final result = create();
    if (selectionId != null) result.selectionId = selectionId;
    return result;
  }

  GetSelection._();

  factory GetSelection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSelection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSelection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'selectionId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSelection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSelection copyWith(void Function(GetSelection) updates) =>
      super.copyWith((message) => updates(message as GetSelection))
          as GetSelection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSelection create() => GetSelection._();
  @$core.override
  GetSelection createEmptyInstance() => create();
  static $pb.PbList<GetSelection> createRepeated() =>
      $pb.PbList<GetSelection>();
  @$core.pragma('dart2js:noInline')
  static GetSelection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSelection>(create);
  static GetSelection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get selectionId => $_getN(0);
  @$pb.TagNumber(1)
  set selectionId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSelectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectionId() => $_clearField(1);
}

class GetSelectionSongCount extends $pb.GeneratedMessage {
  factory GetSelectionSongCount({
    $core.List<$core.int>? selectionId,
    $core.List<$core.int>? energies,
  }) {
    final result = create();
    if (selectionId != null) result.selectionId = selectionId;
    if (energies != null) result.energies = energies;
    return result;
  }

  GetSelectionSongCount._();

  factory GetSelectionSongCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSelectionSongCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSelectionSongCount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'selectionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'energies', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSelectionSongCount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSelectionSongCount copyWith(
          void Function(GetSelectionSongCount) updates) =>
      super.copyWith((message) => updates(message as GetSelectionSongCount))
          as GetSelectionSongCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSelectionSongCount create() => GetSelectionSongCount._();
  @$core.override
  GetSelectionSongCount createEmptyInstance() => create();
  static $pb.PbList<GetSelectionSongCount> createRepeated() =>
      $pb.PbList<GetSelectionSongCount>();
  @$core.pragma('dart2js:noInline')
  static GetSelectionSongCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSelectionSongCount>(create);
  static GetSelectionSongCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get selectionId => $_getN(0);
  @$pb.TagNumber(1)
  set selectionId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSelectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get energies => $_getN(1);
  @$pb.TagNumber(2)
  set energies($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnergies() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergies() => $_clearField(2);
}

class GetSelectionSongs extends $pb.GeneratedMessage {
  factory GetSelectionSongs({
    $core.List<$core.int>? selectionId,
    $core.List<$core.int>? energies,
    $core.int? sortMode,
    $core.int? startIndex,
    $core.int? endIndex,
  }) {
    final result = create();
    if (selectionId != null) result.selectionId = selectionId;
    if (energies != null) result.energies = energies;
    if (sortMode != null) result.sortMode = sortMode;
    if (startIndex != null) result.startIndex = startIndex;
    if (endIndex != null) result.endIndex = endIndex;
    return result;
  }

  GetSelectionSongs._();

  factory GetSelectionSongs.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSelectionSongs.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSelectionSongs',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'selectionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'energies', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'sortMode', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'startIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'endIndex', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSelectionSongs clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSelectionSongs copyWith(void Function(GetSelectionSongs) updates) =>
      super.copyWith((message) => updates(message as GetSelectionSongs))
          as GetSelectionSongs;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSelectionSongs create() => GetSelectionSongs._();
  @$core.override
  GetSelectionSongs createEmptyInstance() => create();
  static $pb.PbList<GetSelectionSongs> createRepeated() =>
      $pb.PbList<GetSelectionSongs>();
  @$core.pragma('dart2js:noInline')
  static GetSelectionSongs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSelectionSongs>(create);
  static GetSelectionSongs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get selectionId => $_getN(0);
  @$pb.TagNumber(1)
  set selectionId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSelectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get energies => $_getN(1);
  @$pb.TagNumber(2)
  set energies($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnergies() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergies() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get sortMode => $_getIZ(2);
  @$pb.TagNumber(3)
  set sortMode($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSortMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearSortMode() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get startIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set startIndex($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStartIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartIndex() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get endIndex => $_getIZ(4);
  @$pb.TagNumber(5)
  set endIndex($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEndIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndIndex() => $_clearField(5);
}

class GetSong extends $pb.GeneratedMessage {
  factory GetSong({
    $core.List<$core.int>? songId,
  }) {
    final result = create();
    if (songId != null) result.songId = songId;
    return result;
  }

  GetSong._();

  factory GetSong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSong',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'songId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSong clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSong copyWith(void Function(GetSong) updates) =>
      super.copyWith((message) => updates(message as GetSong)) as GetSong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSong create() => GetSong._();
  @$core.override
  GetSong createEmptyInstance() => create();
  static $pb.PbList<GetSong> createRepeated() => $pb.PbList<GetSong>();
  @$core.pragma('dart2js:noInline')
  static GetSong getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSong>(create);
  static GetSong? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get songId => $_getN(0);
  @$pb.TagNumber(1)
  set songId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => $_clearField(1);
}

class SetSchedule extends $pb.GeneratedMessage {
  factory SetSchedule({
    $core.List<$core.int>? scheduleId,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    return result;
  }

  SetSchedule._();

  factory SetSchedule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetSchedule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetSchedule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'scheduleId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSchedule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSchedule copyWith(void Function(SetSchedule) updates) =>
      super.copyWith((message) => updates(message as SetSchedule))
          as SetSchedule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetSchedule create() => SetSchedule._();
  @$core.override
  SetSchedule createEmptyInstance() => create();
  static $pb.PbList<SetSchedule> createRepeated() => $pb.PbList<SetSchedule>();
  @$core.pragma('dart2js:noInline')
  static SetSchedule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetSchedule>(create);
  static SetSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get scheduleId => $_getN(0);
  @$pb.TagNumber(1)
  set scheduleId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);
}

class SetSelection extends $pb.GeneratedMessage {
  factory SetSelection({
    $core.List<$core.int>? selectionId,
    $core.List<$core.int>? startSongId,
    $core.List<$core.int>? energies,
    $core.int? songDuration,
  }) {
    final result = create();
    if (selectionId != null) result.selectionId = selectionId;
    if (startSongId != null) result.startSongId = startSongId;
    if (energies != null) result.energies = energies;
    if (songDuration != null) result.songDuration = songDuration;
    return result;
  }

  SetSelection._();

  factory SetSelection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetSelection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetSelection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'selectionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'startSongId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'energies', $pb.PbFieldType.OY)
    ..aI(4, _omitFieldNames ? '' : 'songDuration',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSelection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSelection copyWith(void Function(SetSelection) updates) =>
      super.copyWith((message) => updates(message as SetSelection))
          as SetSelection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetSelection create() => SetSelection._();
  @$core.override
  SetSelection createEmptyInstance() => create();
  static $pb.PbList<SetSelection> createRepeated() =>
      $pb.PbList<SetSelection>();
  @$core.pragma('dart2js:noInline')
  static SetSelection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetSelection>(create);
  static SetSelection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get selectionId => $_getN(0);
  @$pb.TagNumber(1)
  set selectionId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSelectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get startSongId => $_getN(1);
  @$pb.TagNumber(2)
  set startSongId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartSongId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartSongId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get energies => $_getN(2);
  @$pb.TagNumber(3)
  set energies($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEnergies() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnergies() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get songDuration => $_getIZ(3);
  @$pb.TagNumber(4)
  set songDuration($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSongDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearSongDuration() => $_clearField(4);
}

class SearchGetCount extends $pb.GeneratedMessage {
  factory SearchGetCount({
    $core.String? query,
  }) {
    final result = create();
    if (query != null) result.query = query;
    return result;
  }

  SearchGetCount._();

  factory SearchGetCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchGetCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchGetCount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGetCount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGetCount copyWith(void Function(SearchGetCount) updates) =>
      super.copyWith((message) => updates(message as SearchGetCount))
          as SearchGetCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchGetCount create() => SearchGetCount._();
  @$core.override
  SearchGetCount createEmptyInstance() => create();
  static $pb.PbList<SearchGetCount> createRepeated() =>
      $pb.PbList<SearchGetCount>();
  @$core.pragma('dart2js:noInline')
  static SearchGetCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchGetCount>(create);
  static SearchGetCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);
}

class SearchGetSongs extends $pb.GeneratedMessage {
  factory SearchGetSongs({
    $core.String? query,
    $core.int? startIndex,
    $core.int? endIndex,
  }) {
    final result = create();
    if (query != null) result.query = query;
    if (startIndex != null) result.startIndex = startIndex;
    if (endIndex != null) result.endIndex = endIndex;
    return result;
  }

  SearchGetSongs._();

  factory SearchGetSongs.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchGetSongs.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchGetSongs',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..aI(2, _omitFieldNames ? '' : 'startIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'endIndex', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGetSongs clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGetSongs copyWith(void Function(SearchGetSongs) updates) =>
      super.copyWith((message) => updates(message as SearchGetSongs))
          as SearchGetSongs;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchGetSongs create() => SearchGetSongs._();
  @$core.override
  SearchGetSongs createEmptyInstance() => create();
  static $pb.PbList<SearchGetSongs> createRepeated() =>
      $pb.PbList<SearchGetSongs>();
  @$core.pragma('dart2js:noInline')
  static SearchGetSongs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchGetSongs>(create);
  static SearchGetSongs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get startIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set startIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get endIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set endIndex($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndIndex() => $_clearField(3);
}

class AddToExceptions extends $pb.GeneratedMessage {
  factory AddToExceptions({
    $core.List<$core.int>? songId,
    $core.bool? skipToNext,
  }) {
    final result = create();
    if (songId != null) result.songId = songId;
    if (skipToNext != null) result.skipToNext = skipToNext;
    return result;
  }

  AddToExceptions._();

  factory AddToExceptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddToExceptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddToExceptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'songId', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'skipToNext')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddToExceptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddToExceptions copyWith(void Function(AddToExceptions) updates) =>
      super.copyWith((message) => updates(message as AddToExceptions))
          as AddToExceptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddToExceptions create() => AddToExceptions._();
  @$core.override
  AddToExceptions createEmptyInstance() => create();
  static $pb.PbList<AddToExceptions> createRepeated() =>
      $pb.PbList<AddToExceptions>();
  @$core.pragma('dart2js:noInline')
  static AddToExceptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddToExceptions>(create);
  static AddToExceptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get songId => $_getN(0);
  @$pb.TagNumber(1)
  set songId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get skipToNext => $_getBF(1);
  @$pb.TagNumber(2)
  set skipToNext($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSkipToNext() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkipToNext() => $_clearField(2);
}

class RemoveFromExceptions extends $pb.GeneratedMessage {
  factory RemoveFromExceptions({
    $core.List<$core.int>? songId,
  }) {
    final result = create();
    if (songId != null) result.songId = songId;
    return result;
  }

  RemoveFromExceptions._();

  factory RemoveFromExceptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveFromExceptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveFromExceptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'songId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromExceptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromExceptions copyWith(void Function(RemoveFromExceptions) updates) =>
      super.copyWith((message) => updates(message as RemoveFromExceptions))
          as RemoveFromExceptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveFromExceptions create() => RemoveFromExceptions._();
  @$core.override
  RemoveFromExceptions createEmptyInstance() => create();
  static $pb.PbList<RemoveFromExceptions> createRepeated() =>
      $pb.PbList<RemoveFromExceptions>();
  @$core.pragma('dart2js:noInline')
  static RemoveFromExceptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveFromExceptions>(create);
  static RemoveFromExceptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get songId => $_getN(0);
  @$pb.TagNumber(1)
  set songId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => $_clearField(1);
}

class GetPinnedSongCount extends $pb.GeneratedMessage {
  factory GetPinnedSongCount() => create();

  GetPinnedSongCount._();

  factory GetPinnedSongCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPinnedSongCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPinnedSongCount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPinnedSongCount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPinnedSongCount copyWith(void Function(GetPinnedSongCount) updates) =>
      super.copyWith((message) => updates(message as GetPinnedSongCount))
          as GetPinnedSongCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPinnedSongCount create() => GetPinnedSongCount._();
  @$core.override
  GetPinnedSongCount createEmptyInstance() => create();
  static $pb.PbList<GetPinnedSongCount> createRepeated() =>
      $pb.PbList<GetPinnedSongCount>();
  @$core.pragma('dart2js:noInline')
  static GetPinnedSongCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPinnedSongCount>(create);
  static GetPinnedSongCount? _defaultInstance;
}

class GetPinnedSongs extends $pb.GeneratedMessage {
  factory GetPinnedSongs({
    $core.int? startIndex,
    $core.int? endIndex,
  }) {
    final result = create();
    if (startIndex != null) result.startIndex = startIndex;
    if (endIndex != null) result.endIndex = endIndex;
    return result;
  }

  GetPinnedSongs._();

  factory GetPinnedSongs.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPinnedSongs.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPinnedSongs',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'startIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'endIndex', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPinnedSongs clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPinnedSongs copyWith(void Function(GetPinnedSongs) updates) =>
      super.copyWith((message) => updates(message as GetPinnedSongs))
          as GetPinnedSongs;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPinnedSongs create() => GetPinnedSongs._();
  @$core.override
  GetPinnedSongs createEmptyInstance() => create();
  static $pb.PbList<GetPinnedSongs> createRepeated() =>
      $pb.PbList<GetPinnedSongs>();
  @$core.pragma('dart2js:noInline')
  static GetPinnedSongs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPinnedSongs>(create);
  static GetPinnedSongs? _defaultInstance;

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

class AddToPinned extends $pb.GeneratedMessage {
  factory AddToPinned({
    $core.List<$core.int>? songId,
    $core.int? index,
  }) {
    final result = create();
    if (songId != null) result.songId = songId;
    if (index != null) result.index = index;
    return result;
  }

  AddToPinned._();

  factory AddToPinned.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddToPinned.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddToPinned',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'songId', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddToPinned clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddToPinned copyWith(void Function(AddToPinned) updates) =>
      super.copyWith((message) => updates(message as AddToPinned))
          as AddToPinned;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddToPinned create() => AddToPinned._();
  @$core.override
  AddToPinned createEmptyInstance() => create();
  static $pb.PbList<AddToPinned> createRepeated() => $pb.PbList<AddToPinned>();
  @$core.pragma('dart2js:noInline')
  static AddToPinned getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddToPinned>(create);
  static AddToPinned? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get songId => $_getN(0);
  @$pb.TagNumber(1)
  set songId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => $_clearField(2);
}

class RemoveFromPinned extends $pb.GeneratedMessage {
  factory RemoveFromPinned({
    $core.List<$core.int>? songId,
  }) {
    final result = create();
    if (songId != null) result.songId = songId;
    return result;
  }

  RemoveFromPinned._();

  factory RemoveFromPinned.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveFromPinned.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveFromPinned',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'songId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromPinned clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromPinned copyWith(void Function(RemoveFromPinned) updates) =>
      super.copyWith((message) => updates(message as RemoveFromPinned))
          as RemoveFromPinned;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveFromPinned create() => RemoveFromPinned._();
  @$core.override
  RemoveFromPinned createEmptyInstance() => create();
  static $pb.PbList<RemoveFromPinned> createRepeated() =>
      $pb.PbList<RemoveFromPinned>();
  @$core.pragma('dart2js:noInline')
  static RemoveFromPinned getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveFromPinned>(create);
  static RemoveFromPinned? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get songId => $_getN(0);
  @$pb.TagNumber(1)
  set songId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => $_clearField(1);
}

class ReorderPinned extends $pb.GeneratedMessage {
  factory ReorderPinned({
    $core.int? a,
    $core.int? b,
  }) {
    final result = create();
    if (a != null) result.a = a;
    if (b != null) result.b = b;
    return result;
  }

  ReorderPinned._();

  factory ReorderPinned.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReorderPinned.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReorderPinned',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'a', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'b', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReorderPinned clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReorderPinned copyWith(void Function(ReorderPinned) updates) =>
      super.copyWith((message) => updates(message as ReorderPinned))
          as ReorderPinned;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReorderPinned create() => ReorderPinned._();
  @$core.override
  ReorderPinned createEmptyInstance() => create();
  static $pb.PbList<ReorderPinned> createRepeated() =>
      $pb.PbList<ReorderPinned>();
  @$core.pragma('dart2js:noInline')
  static ReorderPinned getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReorderPinned>(create);
  static ReorderPinned? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get a => $_getIZ(0);
  @$pb.TagNumber(1)
  set a($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get b => $_getIZ(1);
  @$pb.TagNumber(2)
  set b($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => $_clearField(2);
}

enum RepoRequest_Action {
  getPresetCount,
  getPresets,
  getSchedule,
  getScheduleRotations,
  getSelection,
  getSelectionSongCount,
  getSelectionSongs,
  getSong,
  setSchedule,
  setSelection,
  searchGetCount,
  searchGetSongs,
  addToExceptions,
  removeFromExceptions,
  getPinnedSongCount,
  getPinnedSongs,
  addToPinned,
  removeFromPinned,
  reorderPinned,
  notSet
}

class RepoRequest extends $pb.GeneratedMessage {
  factory RepoRequest({
    GetPresetCount? getPresetCount,
    GetPresets? getPresets,
    GetSchedule? getSchedule,
    GetScheduleRotations? getScheduleRotations,
    GetSelection? getSelection,
    GetSelectionSongCount? getSelectionSongCount,
    GetSelectionSongs? getSelectionSongs,
    GetSong? getSong,
    SetSchedule? setSchedule,
    SetSelection? setSelection,
    SearchGetCount? searchGetCount,
    SearchGetSongs? searchGetSongs,
    AddToExceptions? addToExceptions,
    RemoveFromExceptions? removeFromExceptions,
    GetPinnedSongCount? getPinnedSongCount,
    GetPinnedSongs? getPinnedSongs,
    AddToPinned? addToPinned,
    RemoveFromPinned? removeFromPinned,
    ReorderPinned? reorderPinned,
  }) {
    final result = create();
    if (getPresetCount != null) result.getPresetCount = getPresetCount;
    if (getPresets != null) result.getPresets = getPresets;
    if (getSchedule != null) result.getSchedule = getSchedule;
    if (getScheduleRotations != null)
      result.getScheduleRotations = getScheduleRotations;
    if (getSelection != null) result.getSelection = getSelection;
    if (getSelectionSongCount != null)
      result.getSelectionSongCount = getSelectionSongCount;
    if (getSelectionSongs != null) result.getSelectionSongs = getSelectionSongs;
    if (getSong != null) result.getSong = getSong;
    if (setSchedule != null) result.setSchedule = setSchedule;
    if (setSelection != null) result.setSelection = setSelection;
    if (searchGetCount != null) result.searchGetCount = searchGetCount;
    if (searchGetSongs != null) result.searchGetSongs = searchGetSongs;
    if (addToExceptions != null) result.addToExceptions = addToExceptions;
    if (removeFromExceptions != null)
      result.removeFromExceptions = removeFromExceptions;
    if (getPinnedSongCount != null)
      result.getPinnedSongCount = getPinnedSongCount;
    if (getPinnedSongs != null) result.getPinnedSongs = getPinnedSongs;
    if (addToPinned != null) result.addToPinned = addToPinned;
    if (removeFromPinned != null) result.removeFromPinned = removeFromPinned;
    if (reorderPinned != null) result.reorderPinned = reorderPinned;
    return result;
  }

  RepoRequest._();

  factory RepoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RepoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RepoRequest_Action>
      _RepoRequest_ActionByTag = {
    1: RepoRequest_Action.getPresetCount,
    2: RepoRequest_Action.getPresets,
    3: RepoRequest_Action.getSchedule,
    4: RepoRequest_Action.getScheduleRotations,
    5: RepoRequest_Action.getSelection,
    6: RepoRequest_Action.getSelectionSongCount,
    7: RepoRequest_Action.getSelectionSongs,
    8: RepoRequest_Action.getSong,
    9: RepoRequest_Action.setSchedule,
    10: RepoRequest_Action.setSelection,
    11: RepoRequest_Action.searchGetCount,
    12: RepoRequest_Action.searchGetSongs,
    13: RepoRequest_Action.addToExceptions,
    14: RepoRequest_Action.removeFromExceptions,
    15: RepoRequest_Action.getPinnedSongCount,
    16: RepoRequest_Action.getPinnedSongs,
    17: RepoRequest_Action.addToPinned,
    18: RepoRequest_Action.removeFromPinned,
    19: RepoRequest_Action.reorderPinned,
    0: RepoRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RepoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request_repo'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])
    ..aOM<GetPresetCount>(1, _omitFieldNames ? '' : 'getPresetCount',
        subBuilder: GetPresetCount.create)
    ..aOM<GetPresets>(2, _omitFieldNames ? '' : 'getPresets',
        subBuilder: GetPresets.create)
    ..aOM<GetSchedule>(3, _omitFieldNames ? '' : 'getSchedule',
        subBuilder: GetSchedule.create)
    ..aOM<GetScheduleRotations>(
        4, _omitFieldNames ? '' : 'getScheduleRotations',
        subBuilder: GetScheduleRotations.create)
    ..aOM<GetSelection>(5, _omitFieldNames ? '' : 'getSelection',
        subBuilder: GetSelection.create)
    ..aOM<GetSelectionSongCount>(
        6, _omitFieldNames ? '' : 'getSelectionSongCount',
        subBuilder: GetSelectionSongCount.create)
    ..aOM<GetSelectionSongs>(7, _omitFieldNames ? '' : 'getSelectionSongs',
        subBuilder: GetSelectionSongs.create)
    ..aOM<GetSong>(8, _omitFieldNames ? '' : 'getSong',
        subBuilder: GetSong.create)
    ..aOM<SetSchedule>(9, _omitFieldNames ? '' : 'setSchedule',
        subBuilder: SetSchedule.create)
    ..aOM<SetSelection>(10, _omitFieldNames ? '' : 'setSelection',
        subBuilder: SetSelection.create)
    ..aOM<SearchGetCount>(11, _omitFieldNames ? '' : 'searchGetCount',
        subBuilder: SearchGetCount.create)
    ..aOM<SearchGetSongs>(12, _omitFieldNames ? '' : 'searchGetSongs',
        subBuilder: SearchGetSongs.create)
    ..aOM<AddToExceptions>(13, _omitFieldNames ? '' : 'addToExceptions',
        subBuilder: AddToExceptions.create)
    ..aOM<RemoveFromExceptions>(
        14, _omitFieldNames ? '' : 'removeFromExceptions',
        subBuilder: RemoveFromExceptions.create)
    ..aOM<GetPinnedSongCount>(15, _omitFieldNames ? '' : 'getPinnedSongCount',
        subBuilder: GetPinnedSongCount.create)
    ..aOM<GetPinnedSongs>(16, _omitFieldNames ? '' : 'getPinnedSongs',
        subBuilder: GetPinnedSongs.create)
    ..aOM<AddToPinned>(17, _omitFieldNames ? '' : 'addToPinned',
        subBuilder: AddToPinned.create)
    ..aOM<RemoveFromPinned>(18, _omitFieldNames ? '' : 'removeFromPinned',
        subBuilder: RemoveFromPinned.create)
    ..aOM<ReorderPinned>(19, _omitFieldNames ? '' : 'reorderPinned',
        subBuilder: ReorderPinned.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RepoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RepoRequest copyWith(void Function(RepoRequest) updates) =>
      super.copyWith((message) => updates(message as RepoRequest))
          as RepoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepoRequest create() => RepoRequest._();
  @$core.override
  RepoRequest createEmptyInstance() => create();
  static $pb.PbList<RepoRequest> createRepeated() => $pb.PbList<RepoRequest>();
  @$core.pragma('dart2js:noInline')
  static RepoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepoRequest>(create);
  static RepoRequest? _defaultInstance;

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
  @$pb.TagNumber(19)
  RepoRequest_Action whichAction() =>
      _RepoRequest_ActionByTag[$_whichOneof(0)]!;
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
  @$pb.TagNumber(19)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetPresetCount get getPresetCount => $_getN(0);
  @$pb.TagNumber(1)
  set getPresetCount(GetPresetCount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGetPresetCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearGetPresetCount() => $_clearField(1);
  @$pb.TagNumber(1)
  GetPresetCount ensureGetPresetCount() => $_ensure(0);

  @$pb.TagNumber(2)
  GetPresets get getPresets => $_getN(1);
  @$pb.TagNumber(2)
  set getPresets(GetPresets value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGetPresets() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetPresets() => $_clearField(2);
  @$pb.TagNumber(2)
  GetPresets ensureGetPresets() => $_ensure(1);

  @$pb.TagNumber(3)
  GetSchedule get getSchedule => $_getN(2);
  @$pb.TagNumber(3)
  set getSchedule(GetSchedule value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGetSchedule() => $_has(2);
  @$pb.TagNumber(3)
  void clearGetSchedule() => $_clearField(3);
  @$pb.TagNumber(3)
  GetSchedule ensureGetSchedule() => $_ensure(2);

  @$pb.TagNumber(4)
  GetScheduleRotations get getScheduleRotations => $_getN(3);
  @$pb.TagNumber(4)
  set getScheduleRotations(GetScheduleRotations value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGetScheduleRotations() => $_has(3);
  @$pb.TagNumber(4)
  void clearGetScheduleRotations() => $_clearField(4);
  @$pb.TagNumber(4)
  GetScheduleRotations ensureGetScheduleRotations() => $_ensure(3);

  @$pb.TagNumber(5)
  GetSelection get getSelection => $_getN(4);
  @$pb.TagNumber(5)
  set getSelection(GetSelection value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGetSelection() => $_has(4);
  @$pb.TagNumber(5)
  void clearGetSelection() => $_clearField(5);
  @$pb.TagNumber(5)
  GetSelection ensureGetSelection() => $_ensure(4);

  @$pb.TagNumber(6)
  GetSelectionSongCount get getSelectionSongCount => $_getN(5);
  @$pb.TagNumber(6)
  set getSelectionSongCount(GetSelectionSongCount value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasGetSelectionSongCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearGetSelectionSongCount() => $_clearField(6);
  @$pb.TagNumber(6)
  GetSelectionSongCount ensureGetSelectionSongCount() => $_ensure(5);

  @$pb.TagNumber(7)
  GetSelectionSongs get getSelectionSongs => $_getN(6);
  @$pb.TagNumber(7)
  set getSelectionSongs(GetSelectionSongs value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasGetSelectionSongs() => $_has(6);
  @$pb.TagNumber(7)
  void clearGetSelectionSongs() => $_clearField(7);
  @$pb.TagNumber(7)
  GetSelectionSongs ensureGetSelectionSongs() => $_ensure(6);

  @$pb.TagNumber(8)
  GetSong get getSong => $_getN(7);
  @$pb.TagNumber(8)
  set getSong(GetSong value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasGetSong() => $_has(7);
  @$pb.TagNumber(8)
  void clearGetSong() => $_clearField(8);
  @$pb.TagNumber(8)
  GetSong ensureGetSong() => $_ensure(7);

  @$pb.TagNumber(9)
  SetSchedule get setSchedule => $_getN(8);
  @$pb.TagNumber(9)
  set setSchedule(SetSchedule value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasSetSchedule() => $_has(8);
  @$pb.TagNumber(9)
  void clearSetSchedule() => $_clearField(9);
  @$pb.TagNumber(9)
  SetSchedule ensureSetSchedule() => $_ensure(8);

  @$pb.TagNumber(10)
  SetSelection get setSelection => $_getN(9);
  @$pb.TagNumber(10)
  set setSelection(SetSelection value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSetSelection() => $_has(9);
  @$pb.TagNumber(10)
  void clearSetSelection() => $_clearField(10);
  @$pb.TagNumber(10)
  SetSelection ensureSetSelection() => $_ensure(9);

  @$pb.TagNumber(11)
  SearchGetCount get searchGetCount => $_getN(10);
  @$pb.TagNumber(11)
  set searchGetCount(SearchGetCount value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasSearchGetCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearSearchGetCount() => $_clearField(11);
  @$pb.TagNumber(11)
  SearchGetCount ensureSearchGetCount() => $_ensure(10);

  @$pb.TagNumber(12)
  SearchGetSongs get searchGetSongs => $_getN(11);
  @$pb.TagNumber(12)
  set searchGetSongs(SearchGetSongs value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasSearchGetSongs() => $_has(11);
  @$pb.TagNumber(12)
  void clearSearchGetSongs() => $_clearField(12);
  @$pb.TagNumber(12)
  SearchGetSongs ensureSearchGetSongs() => $_ensure(11);

  @$pb.TagNumber(13)
  AddToExceptions get addToExceptions => $_getN(12);
  @$pb.TagNumber(13)
  set addToExceptions(AddToExceptions value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasAddToExceptions() => $_has(12);
  @$pb.TagNumber(13)
  void clearAddToExceptions() => $_clearField(13);
  @$pb.TagNumber(13)
  AddToExceptions ensureAddToExceptions() => $_ensure(12);

  @$pb.TagNumber(14)
  RemoveFromExceptions get removeFromExceptions => $_getN(13);
  @$pb.TagNumber(14)
  set removeFromExceptions(RemoveFromExceptions value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasRemoveFromExceptions() => $_has(13);
  @$pb.TagNumber(14)
  void clearRemoveFromExceptions() => $_clearField(14);
  @$pb.TagNumber(14)
  RemoveFromExceptions ensureRemoveFromExceptions() => $_ensure(13);

  @$pb.TagNumber(15)
  GetPinnedSongCount get getPinnedSongCount => $_getN(14);
  @$pb.TagNumber(15)
  set getPinnedSongCount(GetPinnedSongCount value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasGetPinnedSongCount() => $_has(14);
  @$pb.TagNumber(15)
  void clearGetPinnedSongCount() => $_clearField(15);
  @$pb.TagNumber(15)
  GetPinnedSongCount ensureGetPinnedSongCount() => $_ensure(14);

  @$pb.TagNumber(16)
  GetPinnedSongs get getPinnedSongs => $_getN(15);
  @$pb.TagNumber(16)
  set getPinnedSongs(GetPinnedSongs value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasGetPinnedSongs() => $_has(15);
  @$pb.TagNumber(16)
  void clearGetPinnedSongs() => $_clearField(16);
  @$pb.TagNumber(16)
  GetPinnedSongs ensureGetPinnedSongs() => $_ensure(15);

  @$pb.TagNumber(17)
  AddToPinned get addToPinned => $_getN(16);
  @$pb.TagNumber(17)
  set addToPinned(AddToPinned value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasAddToPinned() => $_has(16);
  @$pb.TagNumber(17)
  void clearAddToPinned() => $_clearField(17);
  @$pb.TagNumber(17)
  AddToPinned ensureAddToPinned() => $_ensure(16);

  @$pb.TagNumber(18)
  RemoveFromPinned get removeFromPinned => $_getN(17);
  @$pb.TagNumber(18)
  set removeFromPinned(RemoveFromPinned value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasRemoveFromPinned() => $_has(17);
  @$pb.TagNumber(18)
  void clearRemoveFromPinned() => $_clearField(18);
  @$pb.TagNumber(18)
  RemoveFromPinned ensureRemoveFromPinned() => $_ensure(17);

  @$pb.TagNumber(19)
  ReorderPinned get reorderPinned => $_getN(18);
  @$pb.TagNumber(19)
  set reorderPinned(ReorderPinned value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasReorderPinned() => $_has(18);
  @$pb.TagNumber(19)
  void clearReorderPinned() => $_clearField(19);
  @$pb.TagNumber(19)
  ReorderPinned ensureReorderPinned() => $_ensure(18);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
