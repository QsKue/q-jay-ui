import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/page_schedule_store.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/rotation_card/rotation_card.dart';

class ScheduleView extends StatelessWidget implements PresetViewDataSource {
  final Schedule schedule;

  const ScheduleView({
    super.key,
    required this.schedule,
  });

  @override
  Object sourceId(BuildContext context) => "schedule-view-${schedule.id}";

  @override
  Widget itemAtIndex(BuildContext context, int index) {
    return RotationCard(
      rotationIndex: index,
      onPresetSelected: (selection) {
        context.read<NavigationStore>().gotoPreset(context, selection);
      },
    );
  }

  @override
  Future<void> prefetchRange(BuildContext context, int start, int count, {Object? sortKey})
    => context.read<SchedulePageStore>().getScheduleRotations(start, count);

  @override
  Widget build(BuildContext context) {
    return PresetView(
      dataSource: this,
      chunkSize: 1,
      overscanChunks: 2,
      itemCount: schedule.rotationCount,
    );
  }
}
