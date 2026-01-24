import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/page_schedule_store.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/rotation_card/rotation_card.dart';

class ScheduleDesktop extends StatelessWidget implements PresetViewDataSource {
  const ScheduleDesktop({super.key});

  @override
  Object sourceId(BuildContext context) => "schedule-desktop";

  @override
  Widget itemAtIndex(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12 + (index == 0 ? 12 : 0), 0, 12),
      child: RotationCard(
        rotationIndex: index,
        onPresetSelected: (selection) {
          context.read<NavigationStore>().gotoPreset(context, selection);
        },
      ),
    );
  }

  @override
  Future<void> prefetchRange(int start, int count, {Object? sortKey}) async {
    return;
  }

  @override
  Widget build(BuildContext context) {
    final schedule = context.select<SchedulePageStore, Schedule?>((store) => store.schedule);

    if (schedule == null) {
      return const Center(child: CircularProgressIndicator());
    }
    
    return PresetView(
      // theme: theme?.presetViewTheme,
      // icon: schedule.icon,
      header: SizedBox(), // PresetType.schedule.name,
      // title: schedule.name,
      dataSource: this,
      itemCount: schedule.rotationCount,
      // itemKey: (index) => "schedule-preset-view-index-$index",
      // onPlay: () {
      //   context.read<SchedulePageStore>().setSchedule(schedule.id);
      // },
    );
  }
}
