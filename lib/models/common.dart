import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qjay/app/app.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;
import 'package:qjay/transport/transport_events.dart';
import 'package:uuid/uuid.dart';

extension ToUuidBytes on String {
  List<int> toUuid() {
    return Uuid.parse(this, validationMode: ValidationMode.strictRFC9562);
  }
}

extension UuidString on Uint8List {
  String toUuidString() {
    return Uuid.unparse(this);
  }
}

sealed class Result<T> {
  const Result();
  bool get isOk => this is Ok<T>;
  bool get isErr => this is Err<T>;

  void handle({ Function(T value)? onSuccess, Function(pberror.Error error)? onError }) => switch (this) {
    Ok<T>(:var value) => onSuccess?.call(value),
    Err<T>(:var error) => onError == null ? MyApp.tempKey.currentContext?.read<AppStore>().showError(error) : onError(error),
  };

  R handleWithResponse<R>({ required R Function(T value) onSuccess, required R Function(pberror.Error error) onError }) => switch (this) {
    Ok<T>(:var value) => onSuccess(value),
    Err<T>(:var error) => onError(error),
  };
}

final class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);
}

final class Err<T> extends Result<T> {
  final pberror.Error error;
  const Err(this.error);
}

enum PlayerState {
  initial(0), stopped(1), playing(2), paused(3);

  final int value;
  const PlayerState(this.value);

  static PlayerState fromValue(int value) {
    for (final e in PlayerState.values) {
      if (e.value == value) return e;
    }
    return PlayerState.stopped;
  }
}

enum SideListPage {
  favorites,
  userPlaylists,
  settings;

  IconData get icon => switch (this) {
    SideListPage.favorites => Icons.featured_play_list_outlined,
    SideListPage.userPlaylists => Icons.person,
    SideListPage.settings => Icons.settings,
  };

  String get label => switch (this) {
    SideListPage.favorites => "Favorites",
    SideListPage.userPlaylists => "Playlists",
    SideListPage.settings => "Settings",
  };
}

extension UpdaterEventUtils on UpdaterEvent {

  double? get eventProgress => switch(this) {
    FetchingSongs(:var progress) => progress,
    _ => null,
  };

  String get message => switch(this) {
    SetupStarted() => "Starting…",
    ExternalFoundSimilar() => "Update is already applied, update anyway?",
    LocalFoundSimilar() => "Update is already applied, update anyway?",
    LocalFoundNewer() => "Local update found",
    FetchingUserData() => "Fetching user data",
    ParsingData() => "Parsing data",
    FetchingSongs() => "Fetching songs",
    DatabaseSetup() => "Setting up database",
    CleanupSongs() => "Cleaning up data",
    SetupComplete() => "Update complete",
    SetupError() => "Unexpected error occured",
  };

  bool get hasRetry => switch(this) {
    SetupError() => true,
    _ => false,
  };
}