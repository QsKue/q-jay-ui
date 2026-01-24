import 'package:flutter/material.dart';

import 'package:qjay/models/presets.dart';
import 'package:qjay/transport/transport.dart';

class SchedulePageStore with ChangeNotifier {
  final Transport _transport;

  SchedulePageStore(this._transport);

  Schedule? _schedule;
  Schedule? get schedule => _schedule;

  int? _currentRotationIndex;
  int? get currentRotationIndex => _currentRotationIndex;

  List<ScheduleRotation?> _scheduleRotations = [];
  List<ScheduleRotation?> get scheduleRotations => _scheduleRotations;

  void load(String id) {
    _transport.getSchedule(id).then((result) {
      result.handle(
        onSuccess: (schedule) {
          _schedule = schedule;
          _scheduleRotations = List.generate(schedule.rotationCount, (_) => null);
        },
      );

      notifyListeners();
    });
  }

  void setSchedule(String scheduleId) => _transport.setSchedule(scheduleId).then((result) => result.handle());

  int _scheduleToken = 0;
  Future<void> getScheduleRotations(int startIndex, int count) async {
    final int requestToken = _scheduleToken;
    
    if (schedule == null) return;

    int? firstNull;
    int? lastNull;
    
    for (int i = startIndex; i < startIndex + count; i++) {
      final isNull = _scheduleRotations[i] == null;
      if (isNull) {
        firstNull ??= i;
        lastNull = i;
      }
    }

    if (firstNull == null || lastNull == null) {
      return;
    }

    startIndex = firstNull;
    count = (lastNull - firstNull) + 1;
    
    final result = await _transport.getScheduleRotations(schedule!.id, startIndex, count);
    if (requestToken != _scheduleToken) return;
    
    result.handle(
      onSuccess: (rotations) {
        void updateCurrentRotation(int currentMinute, int index) {
          if (_currentRotationIndex != null) return;

          final rotation = _scheduleRotations[index];
          if ((rotation != null) && (rotation.endMinute != null)) {
            if ((currentMinute >= rotation.minute) && (currentMinute < rotation.endMinute!)) {
              _currentRotationIndex = index;
            } else if ((currentMinute >= rotation.minute) && (rotation.minute > rotation.endMinute!)) {
              _currentRotationIndex = index;
            }
          }
        }

        DateTime now = DateTime.now();
        int currentMinute = now.hour * 60 + now.minute;
        for (int i = 0; i < rotations.rotationList.length; i++) {
          final index = rotations.startIndex + i;
          
          _scheduleRotations[index] = rotations.rotationList[i];
          
          if (index > 0) {
            _scheduleRotations[index - 1] = _scheduleRotations.elementAtOrNull(index - 1)?.copyWith(
              endMinute: rotations.rotationList[i].minute
            );

            updateCurrentRotation(currentMinute, index - 1);
          }

          if (index == _scheduleRotations.length - 1) {
            _scheduleRotations[index] = _scheduleRotations.elementAtOrNull(index)?.copyWith(
              endMinute: _scheduleRotations.elementAtOrNull(0)?.minute
            );

            updateCurrentRotation(currentMinute, index);
          }
        }

        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _scheduleToken++;
    super.dispose();
  }
}