import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/page_schedule_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/button/back_button.dart';
import 'package:qjay/widgets/navigation_bar/bottom_navigation_bar.dart';
import 'package:qjay/widgets/player_bar/player_bar_compact.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/rotation_card/rotation_card.dart';

class ScheduleCompact extends StatefulWidget {
  const ScheduleCompact({super.key});

  @override
  State<ScheduleCompact> createState() => _ScheduleCompactState();
}

class _ScheduleCompactState extends State<ScheduleCompact> implements PresetViewDataSource {

  @override
  Object sourceId(BuildContext context) => "schedule-desktop";

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
  Future<void> prefetchRange(BuildContext context, start, int count, {Object? sortKey})
    => context.read<SchedulePageStore>().getScheduleRotations(start, count);

  @override
  Widget build(BuildContext context) {
    final schedule = context.select<SchedulePageStore, Schedule?>((store) => store.schedule);

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final appBarIcon = schedule == null ? QJay.qs_logo : schedule.icon;
    final title = schedule == null ? "" : schedule.name;

    final playerState = context.select<PlayerStore, PlayerState>((store) => store.playerState);
    final currentPreset = context.select<PlayerStore, (PresetType, String)?>((store) => store.currentPreset);
    
    final isCurrent = (currentPreset?.$1 == PresetType.schedule) && (currentPreset?.$2 == schedule?.id);
    final isPlaying = isCurrent && (playerState == PlayerState.playing);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isCurrent ? colorScheme.primary.withValues(alpha: 0.16) : null,
        leading: NavigationBackButton(icon: appBarIcon),
        titleSpacing: 0,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            title,
            style: themeData.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            )
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton.filled(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorScheme.primaryContainer),
                iconColor: WidgetStatePropertyAll(colorScheme.onPrimary),
              ),
              icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
              onPressed: () {
                if (schedule == null) return;

                if (isCurrent) {
                  if (isPlaying) {
                    context.read<PlayerStore>().pause();
                  } else {
                    context.read<PlayerStore>().play();
                  }
                } else {
                  context.read<SchedulePageStore>().setSchedule(schedule.id);
                }
              },
              // isActive: true,
            ),
          ),
        ],
      ),

      body: Builder(builder: (context) {

        if (schedule == null) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return Column(
          children: [
            
              Expanded(
                child: PresetView(
                  dataSource: this,
                  chunkSize: 1,
                  overscanChunks: 2,
                  itemCount: schedule.rotationCount,
                ),
              ),
        
            PlayerBarCompact(),
          ]
        );
      }),

      bottomNavigationBar: AppBottomNavigationBar(index: 0),
    );
  }
}
