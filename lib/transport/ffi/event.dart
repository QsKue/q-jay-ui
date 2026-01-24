import 'dart:typed_data';

import 'package:qjay/models/common.dart';
import 'package:qjay/transport/proto/adapters.dart';
import 'package:qjay/transport/proto/remote.pb.dart' as proto;

import '../transport_events.dart';

TransportEvent? decodeTransportEvent(dynamic raw) {
  if (raw is TransportEvent) return raw;

  if (raw is! List || raw.length < 2) return null;
  
  final code = raw[0] as int;
  final data = raw[1];
  
  // Selection events
  if (code == 1) {
    final scheduleId = data[0] as String;
    final rotationIndex = data[1] as int;
    final segmentIndex = data[2] as int;

    return TransportEventScheduleUpdated(scheduleId, rotationIndex, segmentIndex);
  }
  if (code == 2) {
    final selectionId = data[0] as String;
    final energies = data[1] as List<int>;
    
    return TransportEventSelectionUpdated(selectionId, energies);
  }
  if (code == 3) {
    final bytes = data as Uint8List;
    final song = proto.Song.fromBuffer(bytes);

    return TransportEventSongUpdated(song.toSong());
  }
  
  // Player events
  if (code == 101) {
    return TransportEventStateUpdated(PlayerState.values[data as int]);
  }
  if (code == 102) {
    return TransportEventProgressUpdated(Duration(milliseconds: data[0] as int), Duration(milliseconds: data[1] as int));
  }

  return null;
}