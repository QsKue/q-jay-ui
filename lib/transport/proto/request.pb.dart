// This is a generated file - do not edit.
//
// Generated from request.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'request_client.pb.dart' as $0;
import 'request_playback.pb.dart' as $2;
import 'request_repo.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum Request_Request { client, repo, playback, notSet }

class Request extends $pb.GeneratedMessage {
  factory Request({
    $0.ClientRequest? client,
    $1.RepoRequest? repo,
    $2.PlaybackRequest? playback,
  }) {
    final result = create();
    if (client != null) result.client = client;
    if (repo != null) result.repo = repo;
    if (playback != null) result.playback = playback;
    return result;
  }

  Request._();

  factory Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Request_Request> _Request_RequestByTag = {
    1: Request_Request.client,
    2: Request_Request.repo,
    3: Request_Request.playback,
    0: Request_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'request'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<$0.ClientRequest>(1, _omitFieldNames ? '' : 'client',
        subBuilder: $0.ClientRequest.create)
    ..aOM<$1.RepoRequest>(2, _omitFieldNames ? '' : 'repo',
        subBuilder: $1.RepoRequest.create)
    ..aOM<$2.PlaybackRequest>(3, _omitFieldNames ? '' : 'playback',
        subBuilder: $2.PlaybackRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Request copyWith(void Function(Request) updates) =>
      super.copyWith((message) => updates(message as Request)) as Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  @$core.override
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  Request_Request whichRequest() => _Request_RequestByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearRequest() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.ClientRequest get client => $_getN(0);
  @$pb.TagNumber(1)
  set client($0.ClientRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ClientRequest ensureClient() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.RepoRequest get repo => $_getN(1);
  @$pb.TagNumber(2)
  set repo($1.RepoRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRepo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRepo() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.RepoRequest ensureRepo() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.PlaybackRequest get playback => $_getN(2);
  @$pb.TagNumber(3)
  set playback($2.PlaybackRequest value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPlayback() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayback() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.PlaybackRequest ensurePlayback() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
