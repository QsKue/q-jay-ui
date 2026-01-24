import 'package:flutter/material.dart';

import 'package:qjay/app/navigator.dart';

import 'song.dart';

enum PresetType {
  schedule, selection, tools, userPlayist;
  
  String get name => switch(this) {
    PresetType.schedule => "Schedule",
    PresetType.selection => "Selection",
    PresetType.tools => "Tools",
    PresetType.userPlayist => "Playlist",
  };

  IconData get icon => switch(this) {
    PresetType.schedule => Icons.schedule,
    PresetType.selection => Icons.queue_music,
    PresetType.tools => Icons.format_list_bulleted,
    PresetType.userPlayist => Icons.person,
  };

  String get route => switch(this) {
    PresetType.schedule => Routes.schedule,
    PresetType.selection => Routes.selection,
    PresetType.tools => Routes.selection,
    PresetType.userPlayist => throw "NOT IMPLEMENTED",
  };
}

sealed class Preset {
  String get id;
  PresetType get type;
  String get route;
  IconData get icon;
  String get category;
  String get name;
}

class RotationSegment {
  final int minutes;
  final String selectionId;
  final List<int> energies;
  final SongDuration songDuration;
  RotationSegment(this.minutes, this.selectionId, this.energies, this.songDuration);
}

class ScheduleRotation {
  final int minute;
  final int? endMinute;
  final List<RotationSegment> segments;
  ScheduleRotation(this.minute, this.endMinute, this.segments);
  ScheduleRotation copyWith({ int? minute, int? endMinute, List<RotationSegment>? segments })
    => ScheduleRotation(minute ?? this.minute, endMinute ?? this.endMinute, segments ?? this.segments);
}

class Schedule extends Preset {
  @override final String id;
  @override PresetType get type => PresetType.schedule;
  @override String get route => Routes.schedule;
  @override IconData get icon => Icons.schedule;
  @override final String category;
  @override final String name;

  final bool pinned;
  final int rotationCount;

  Schedule(this.id, this.name, this.pinned, this.rotationCount) : category = "Schedule";
}

class Selection extends Preset {
  @override final String id;
  @override PresetType get type => isTools ? PresetType.tools : PresetType.selection;
  @override String get route => Routes.selection;
  @override IconData get icon => isTools ? Icons.format_list_bulleted : Icons.queue_music;
  @override final String category;
  @override final String name;

  bool get isTools => category == "Tools";

  final bool pinned;
  final List<int> availableEnergies;
  final List<int> defaultEnergies;
  final int defaultSongCount;

  Selection(this.id, this.category, this.name, this.pinned, this.availableEnergies, this.defaultEnergies, this.defaultSongCount);

  List<List<int>> energiesFromGrouping(int grouping) {
    if (grouping <= 0 || availableEnergies.length < grouping) return [];
    return List.generate(availableEnergies.length - grouping + 1, (i) => availableEnergies.sublist(i, i + grouping));
  }
}

class UserPlaylist extends Preset {
  @override final String id;
  @override PresetType get type => PresetType.userPlayist;
  @override String get route => Routes.selection;
  @override IconData get icon => Icons.person;
  @override final String category;
  @override final String name;

  final bool pinned;
  late List<Song> songs;

  UserPlaylist(this.id, this.category, this.name, this.pinned) : songs = [];
}