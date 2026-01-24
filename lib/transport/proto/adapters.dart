import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:uuid/uuid.dart';

import 'remote.pb.dart' as proto;

extension ToPreset on proto.Preset {
  Preset? toPreset() => switch (whichKind()) {
    proto.Preset_Kind.schedule => schedule.toSchedule(),
    proto.Preset_Kind.selection => selection.toSelection(),
    proto.Preset_Kind.notSet => null,
  };
}

extension ToSchedule on proto.Schedule {
  Schedule toSchedule() {
    return Schedule(Uuid.unparse(id), name, pinned, rotationCount);
  }
}

extension ToRotation on proto.ScheduleRotation {
  ScheduleRotation toRotation() {
    List<RotationSegment> mapSegments(List<proto.RotationSegment> segments) {
      return segments.map((segment) {
        return RotationSegment(
          segment.minutes,
          Uuid.unparse(segment.selectionId),
          segment.energies.map((e) => e.toInt()).toList(growable: false),
          SongDuration.fromValue(segment.songDuration),
        );
      }).toList(growable: false);
    }

    final start = minute;
    final segments = mapSegments(this.segments);
    return ScheduleRotation(start, null, segments);
  }
}

extension ToSelection on proto.Selection {
  Selection toSelection() {
    return Selection(Uuid.unparse(id), category, name, pinned, availableEnergies, defaultEnergies, defaultSongCount);
  }
}

extension ToSong on proto.Song {
  Song toSong() {
    return Song(
      id: Uuid.unparse(id),
      artist: artist,
      title: title,
      played: played,
      liked: liked,
      pinned: pinned,
      banned: banned,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(dateAddedMs.toInt())
    );
  }
}