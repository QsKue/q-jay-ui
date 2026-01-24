// This is a generated file - do not edit.
//
// Generated from request_playback.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Setup extends $pb.GeneratedMessage {
  factory Setup() => create();

  Setup._();

  factory Setup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Setup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Setup',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Setup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Setup copyWith(void Function(Setup) updates) =>
      super.copyWith((message) => updates(message as Setup)) as Setup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Setup create() => Setup._();
  @$core.override
  Setup createEmptyInstance() => create();
  static $pb.PbList<Setup> createRepeated() => $pb.PbList<Setup>();
  @$core.pragma('dart2js:noInline')
  static Setup getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Setup>(create);
  static Setup? _defaultInstance;
}

class Play extends $pb.GeneratedMessage {
  factory Play() => create();

  Play._();

  factory Play.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Play.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Play',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Play clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Play copyWith(void Function(Play) updates) =>
      super.copyWith((message) => updates(message as Play)) as Play;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Play create() => Play._();
  @$core.override
  Play createEmptyInstance() => create();
  static $pb.PbList<Play> createRepeated() => $pb.PbList<Play>();
  @$core.pragma('dart2js:noInline')
  static Play getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Play>(create);
  static Play? _defaultInstance;
}

class Pause extends $pb.GeneratedMessage {
  factory Pause() => create();

  Pause._();

  factory Pause.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Pause.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pause',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pause clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pause copyWith(void Function(Pause) updates) =>
      super.copyWith((message) => updates(message as Pause)) as Pause;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pause create() => Pause._();
  @$core.override
  Pause createEmptyInstance() => create();
  static $pb.PbList<Pause> createRepeated() => $pb.PbList<Pause>();
  @$core.pragma('dart2js:noInline')
  static Pause getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pause>(create);
  static Pause? _defaultInstance;
}

class Stop extends $pb.GeneratedMessage {
  factory Stop() => create();

  Stop._();

  factory Stop.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Stop.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Stop',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stop clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stop copyWith(void Function(Stop) updates) =>
      super.copyWith((message) => updates(message as Stop)) as Stop;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Stop create() => Stop._();
  @$core.override
  Stop createEmptyInstance() => create();
  static $pb.PbList<Stop> createRepeated() => $pb.PbList<Stop>();
  @$core.pragma('dart2js:noInline')
  static Stop getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stop>(create);
  static Stop? _defaultInstance;
}

class Next extends $pb.GeneratedMessage {
  factory Next() => create();

  Next._();

  factory Next.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Next.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Next',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Next clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Next copyWith(void Function(Next) updates) =>
      super.copyWith((message) => updates(message as Next)) as Next;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Next create() => Next._();
  @$core.override
  Next createEmptyInstance() => create();
  static $pb.PbList<Next> createRepeated() => $pb.PbList<Next>();
  @$core.pragma('dart2js:noInline')
  static Next getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Next>(create);
  static Next? _defaultInstance;
}

class SkipToSong extends $pb.GeneratedMessage {
  factory SkipToSong({
    $core.List<$core.int>? songId,
  }) {
    final result = create();
    if (songId != null) result.songId = songId;
    return result;
  }

  SkipToSong._();

  factory SkipToSong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SkipToSong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SkipToSong',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'songId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SkipToSong clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SkipToSong copyWith(void Function(SkipToSong) updates) =>
      super.copyWith((message) => updates(message as SkipToSong)) as SkipToSong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SkipToSong create() => SkipToSong._();
  @$core.override
  SkipToSong createEmptyInstance() => create();
  static $pb.PbList<SkipToSong> createRepeated() => $pb.PbList<SkipToSong>();
  @$core.pragma('dart2js:noInline')
  static SkipToSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SkipToSong>(create);
  static SkipToSong? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get songId => $_getN(0);
  @$pb.TagNumber(1)
  set songId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => $_clearField(1);
}

class GetCurrentPreset extends $pb.GeneratedMessage {
  factory GetCurrentPreset() => create();

  GetCurrentPreset._();

  factory GetCurrentPreset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentPreset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentPreset',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentPreset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentPreset copyWith(void Function(GetCurrentPreset) updates) =>
      super.copyWith((message) => updates(message as GetCurrentPreset))
          as GetCurrentPreset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentPreset create() => GetCurrentPreset._();
  @$core.override
  GetCurrentPreset createEmptyInstance() => create();
  static $pb.PbList<GetCurrentPreset> createRepeated() =>
      $pb.PbList<GetCurrentPreset>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentPreset getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentPreset>(create);
  static GetCurrentPreset? _defaultInstance;
}

class GetCurrentSong extends $pb.GeneratedMessage {
  factory GetCurrentSong() => create();

  GetCurrentSong._();

  factory GetCurrentSong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentSong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentSong',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentSong clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentSong copyWith(void Function(GetCurrentSong) updates) =>
      super.copyWith((message) => updates(message as GetCurrentSong))
          as GetCurrentSong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentSong create() => GetCurrentSong._();
  @$core.override
  GetCurrentSong createEmptyInstance() => create();
  static $pb.PbList<GetCurrentSong> createRepeated() =>
      $pb.PbList<GetCurrentSong>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentSong>(create);
  static GetCurrentSong? _defaultInstance;
}

class GetCurrentState extends $pb.GeneratedMessage {
  factory GetCurrentState() => create();

  GetCurrentState._();

  factory GetCurrentState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentState',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentState copyWith(void Function(GetCurrentState) updates) =>
      super.copyWith((message) => updates(message as GetCurrentState))
          as GetCurrentState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentState create() => GetCurrentState._();
  @$core.override
  GetCurrentState createEmptyInstance() => create();
  static $pb.PbList<GetCurrentState> createRepeated() =>
      $pb.PbList<GetCurrentState>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentState>(create);
  static GetCurrentState? _defaultInstance;
}

class SetProgress extends $pb.GeneratedMessage {
  factory SetProgress({
    $core.double? percentage,
  }) {
    final result = create();
    if (percentage != null) result.percentage = percentage;
    return result;
  }

  SetProgress._();

  factory SetProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetProgress',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'percentage', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetProgress copyWith(void Function(SetProgress) updates) =>
      super.copyWith((message) => updates(message as SetProgress))
          as SetProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetProgress create() => SetProgress._();
  @$core.override
  SetProgress createEmptyInstance() => create();
  static $pb.PbList<SetProgress> createRepeated() => $pb.PbList<SetProgress>();
  @$core.pragma('dart2js:noInline')
  static SetProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetProgress>(create);
  static SetProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get percentage => $_getN(0);
  @$pb.TagNumber(1)
  set percentage($core.double value) => $_setFloat(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPercentage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercentage() => $_clearField(1);
}

class GetVolume extends $pb.GeneratedMessage {
  factory GetVolume() => create();

  GetVolume._();

  factory GetVolume.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVolume.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVolume',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVolume clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVolume copyWith(void Function(GetVolume) updates) =>
      super.copyWith((message) => updates(message as GetVolume)) as GetVolume;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVolume create() => GetVolume._();
  @$core.override
  GetVolume createEmptyInstance() => create();
  static $pb.PbList<GetVolume> createRepeated() => $pb.PbList<GetVolume>();
  @$core.pragma('dart2js:noInline')
  static GetVolume getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVolume>(create);
  static GetVolume? _defaultInstance;
}

class SetVolume extends $pb.GeneratedMessage {
  factory SetVolume({
    $core.double? percentage,
  }) {
    final result = create();
    if (percentage != null) result.percentage = percentage;
    return result;
  }

  SetVolume._();

  factory SetVolume.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetVolume.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetVolume',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'percentage', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetVolume clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetVolume copyWith(void Function(SetVolume) updates) =>
      super.copyWith((message) => updates(message as SetVolume)) as SetVolume;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetVolume create() => SetVolume._();
  @$core.override
  SetVolume createEmptyInstance() => create();
  static $pb.PbList<SetVolume> createRepeated() => $pb.PbList<SetVolume>();
  @$core.pragma('dart2js:noInline')
  static SetVolume getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetVolume>(create);
  static SetVolume? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get percentage => $_getN(0);
  @$pb.TagNumber(1)
  set percentage($core.double value) => $_setFloat(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPercentage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercentage() => $_clearField(1);
}

enum PlaybackRequest_Action {
  setup,
  play,
  pause,
  stop,
  next,
  skipToSong,
  getCurrentPreset,
  getCurrentSong,
  getCurrentState,
  setProgress,
  getVolume,
  setVolume,
  notSet
}

class PlaybackRequest extends $pb.GeneratedMessage {
  factory PlaybackRequest({
    Setup? setup,
    Play? play,
    Pause? pause,
    Stop? stop,
    Next? next,
    SkipToSong? skipToSong,
    GetCurrentPreset? getCurrentPreset,
    GetCurrentSong? getCurrentSong,
    GetCurrentState? getCurrentState,
    SetProgress? setProgress,
    GetVolume? getVolume,
    SetVolume? setVolume,
  }) {
    final result = create();
    if (setup != null) result.setup = setup;
    if (play != null) result.play = play;
    if (pause != null) result.pause = pause;
    if (stop != null) result.stop = stop;
    if (next != null) result.next = next;
    if (skipToSong != null) result.skipToSong = skipToSong;
    if (getCurrentPreset != null) result.getCurrentPreset = getCurrentPreset;
    if (getCurrentSong != null) result.getCurrentSong = getCurrentSong;
    if (getCurrentState != null) result.getCurrentState = getCurrentState;
    if (setProgress != null) result.setProgress = setProgress;
    if (getVolume != null) result.getVolume = getVolume;
    if (setVolume != null) result.setVolume = setVolume;
    return result;
  }

  PlaybackRequest._();

  factory PlaybackRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlaybackRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, PlaybackRequest_Action>
      _PlaybackRequest_ActionByTag = {
    1: PlaybackRequest_Action.setup,
    2: PlaybackRequest_Action.play,
    3: PlaybackRequest_Action.pause,
    4: PlaybackRequest_Action.stop,
    5: PlaybackRequest_Action.next,
    6: PlaybackRequest_Action.skipToSong,
    7: PlaybackRequest_Action.getCurrentPreset,
    8: PlaybackRequest_Action.getCurrentSong,
    9: PlaybackRequest_Action.getCurrentState,
    10: PlaybackRequest_Action.setProgress,
    11: PlaybackRequest_Action.getVolume,
    12: PlaybackRequest_Action.setVolume,
    0: PlaybackRequest_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlaybackRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'request_playback'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    ..aOM<Setup>(1, _omitFieldNames ? '' : 'setup', subBuilder: Setup.create)
    ..aOM<Play>(2, _omitFieldNames ? '' : 'play', subBuilder: Play.create)
    ..aOM<Pause>(3, _omitFieldNames ? '' : 'pause', subBuilder: Pause.create)
    ..aOM<Stop>(4, _omitFieldNames ? '' : 'stop', subBuilder: Stop.create)
    ..aOM<Next>(5, _omitFieldNames ? '' : 'next', subBuilder: Next.create)
    ..aOM<SkipToSong>(6, _omitFieldNames ? '' : 'skipToSong',
        subBuilder: SkipToSong.create)
    ..aOM<GetCurrentPreset>(7, _omitFieldNames ? '' : 'getCurrentPreset',
        subBuilder: GetCurrentPreset.create)
    ..aOM<GetCurrentSong>(8, _omitFieldNames ? '' : 'getCurrentSong',
        subBuilder: GetCurrentSong.create)
    ..aOM<GetCurrentState>(9, _omitFieldNames ? '' : 'getCurrentState',
        subBuilder: GetCurrentState.create)
    ..aOM<SetProgress>(10, _omitFieldNames ? '' : 'setProgress',
        subBuilder: SetProgress.create)
    ..aOM<GetVolume>(11, _omitFieldNames ? '' : 'getVolume',
        subBuilder: GetVolume.create)
    ..aOM<SetVolume>(12, _omitFieldNames ? '' : 'setVolume',
        subBuilder: SetVolume.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlaybackRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlaybackRequest copyWith(void Function(PlaybackRequest) updates) =>
      super.copyWith((message) => updates(message as PlaybackRequest))
          as PlaybackRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaybackRequest create() => PlaybackRequest._();
  @$core.override
  PlaybackRequest createEmptyInstance() => create();
  static $pb.PbList<PlaybackRequest> createRepeated() =>
      $pb.PbList<PlaybackRequest>();
  @$core.pragma('dart2js:noInline')
  static PlaybackRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlaybackRequest>(create);
  static PlaybackRequest? _defaultInstance;

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
  PlaybackRequest_Action whichAction() =>
      _PlaybackRequest_ActionByTag[$_whichOneof(0)]!;
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
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Setup get setup => $_getN(0);
  @$pb.TagNumber(1)
  set setup(Setup value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSetup() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetup() => $_clearField(1);
  @$pb.TagNumber(1)
  Setup ensureSetup() => $_ensure(0);

  @$pb.TagNumber(2)
  Play get play => $_getN(1);
  @$pb.TagNumber(2)
  set play(Play value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPlay() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlay() => $_clearField(2);
  @$pb.TagNumber(2)
  Play ensurePlay() => $_ensure(1);

  @$pb.TagNumber(3)
  Pause get pause => $_getN(2);
  @$pb.TagNumber(3)
  set pause(Pause value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPause() => $_has(2);
  @$pb.TagNumber(3)
  void clearPause() => $_clearField(3);
  @$pb.TagNumber(3)
  Pause ensurePause() => $_ensure(2);

  @$pb.TagNumber(4)
  Stop get stop => $_getN(3);
  @$pb.TagNumber(4)
  set stop(Stop value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStop() => $_has(3);
  @$pb.TagNumber(4)
  void clearStop() => $_clearField(4);
  @$pb.TagNumber(4)
  Stop ensureStop() => $_ensure(3);

  @$pb.TagNumber(5)
  Next get next => $_getN(4);
  @$pb.TagNumber(5)
  set next(Next value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNext() => $_has(4);
  @$pb.TagNumber(5)
  void clearNext() => $_clearField(5);
  @$pb.TagNumber(5)
  Next ensureNext() => $_ensure(4);

  @$pb.TagNumber(6)
  SkipToSong get skipToSong => $_getN(5);
  @$pb.TagNumber(6)
  set skipToSong(SkipToSong value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSkipToSong() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkipToSong() => $_clearField(6);
  @$pb.TagNumber(6)
  SkipToSong ensureSkipToSong() => $_ensure(5);

  @$pb.TagNumber(7)
  GetCurrentPreset get getCurrentPreset => $_getN(6);
  @$pb.TagNumber(7)
  set getCurrentPreset(GetCurrentPreset value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasGetCurrentPreset() => $_has(6);
  @$pb.TagNumber(7)
  void clearGetCurrentPreset() => $_clearField(7);
  @$pb.TagNumber(7)
  GetCurrentPreset ensureGetCurrentPreset() => $_ensure(6);

  @$pb.TagNumber(8)
  GetCurrentSong get getCurrentSong => $_getN(7);
  @$pb.TagNumber(8)
  set getCurrentSong(GetCurrentSong value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasGetCurrentSong() => $_has(7);
  @$pb.TagNumber(8)
  void clearGetCurrentSong() => $_clearField(8);
  @$pb.TagNumber(8)
  GetCurrentSong ensureGetCurrentSong() => $_ensure(7);

  @$pb.TagNumber(9)
  GetCurrentState get getCurrentState => $_getN(8);
  @$pb.TagNumber(9)
  set getCurrentState(GetCurrentState value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasGetCurrentState() => $_has(8);
  @$pb.TagNumber(9)
  void clearGetCurrentState() => $_clearField(9);
  @$pb.TagNumber(9)
  GetCurrentState ensureGetCurrentState() => $_ensure(8);

  @$pb.TagNumber(10)
  SetProgress get setProgress => $_getN(9);
  @$pb.TagNumber(10)
  set setProgress(SetProgress value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSetProgress() => $_has(9);
  @$pb.TagNumber(10)
  void clearSetProgress() => $_clearField(10);
  @$pb.TagNumber(10)
  SetProgress ensureSetProgress() => $_ensure(9);

  @$pb.TagNumber(11)
  GetVolume get getVolume => $_getN(10);
  @$pb.TagNumber(11)
  set getVolume(GetVolume value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasGetVolume() => $_has(10);
  @$pb.TagNumber(11)
  void clearGetVolume() => $_clearField(11);
  @$pb.TagNumber(11)
  GetVolume ensureGetVolume() => $_ensure(10);

  @$pb.TagNumber(12)
  SetVolume get setVolume => $_getN(11);
  @$pb.TagNumber(12)
  set setVolume(SetVolume value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasSetVolume() => $_has(11);
  @$pb.TagNumber(12)
  void clearSetVolume() => $_clearField(12);
  @$pb.TagNumber(12)
  SetVolume ensureSetVolume() => $_ensure(11);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
