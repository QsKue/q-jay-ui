import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qjay/app/store/navigation_store.dart';

import 'package:qjay/app/store/page_schedule_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/rotation_card/rotation_card_placeholder.dart';
import 'package:qjay/widgets/rotation_card/rotation_card_segment.dart';

class RotationCard extends StatelessWidget {
  final int rotationIndex;
  final void Function(Selection selection)? onPresetSelected;

  const RotationCard({
    super.key,
    required this.rotationIndex,
    this.onPresetSelected,
  });

  String formatMinute(int? minute) {
    if (minute == null) return "";

    final clamped = minute % 1440;
    final hours = clamped ~/ 60;
    final minutes = clamped % 60;
    final period = hours >= 12 ? 'PM' : 'AM';
    final displayHour = hours % 12 == 0 ? 12 : hours % 12;
    return '$displayHour:${minutes.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    final schedule = context.select<SchedulePageStore, Schedule?>((store) => store.schedule);
    final rotation = context.select<SchedulePageStore, ScheduleRotation?>((store) => store.scheduleRotations[rotationIndex]);
    if ((schedule == null) || (rotation == null)) return RotationCardPlaceholder();

    final themeData = Theme.of(context);

    final colorScheme = ColorScheme.of(context);
    final startTime = formatMinute(rotation.minute);
    final endTime = formatMinute(rotation.endMinute);

    final isCurrent = context.select<PlayerStore, bool>((store) => (store.currentPreset?.$1 == PresetType.schedule) && (store.currentPreset?.$2 == schedule.id));
    final playingRotationIndex = (isCurrent ? context.select<PlayerStore, int?>((store) => store.currentPresetDetails?.elementAtOrNull(0)) : null);
    final activeRotationIndex = playingRotationIndex ?? context.select<SchedulePageStore, int?>((store) => store.currentRotationIndex);
    final activeSegmentIndex = isCurrent ? context.select<PlayerStore, int?>((store) => store.currentPresetDetails?.elementAtOrNull(1)) : null;

    final selectionMap = context.select<NavigationStore, Map<String, Selection>>((store) => store.selectionMap);
    final isHighlighted = activeRotationIndex == rotationIndex;
    
    final headerStyle = isHighlighted
      ? themeData.textTheme.labelLarge?.copyWith(color: colorScheme.onPrimary)
      : themeData.textTheme.labelLarge?.copyWith(color: colorScheme.onSurface);

    return Padding(
      key: Key("rotcard-schedule-${schedule.id}-highlighted-$isHighlighted"),
      padding: EdgeInsets.all(4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            initiallyExpanded: isHighlighted,
            collapsedBackgroundColor: isHighlighted? colorScheme.primaryContainer : colorScheme.surfaceContainer,
            backgroundColor: isHighlighted ? colorScheme.primaryContainer : colorScheme.surfaceContainer,
            iconColor: isHighlighted ? colorScheme.onPrimary : colorScheme.onSurface,
            collapsedIconColor: isHighlighted ? colorScheme.onPrimary : colorScheme.onSurface,
            title: Text(
              "$startTime - $endTime",
              style: headerStyle,
              overflow: TextOverflow.ellipsis,
            ),
            children: [
          
              Column(
                children: [
                  
                  Container(
                    color: isHighlighted ? colorScheme.surfaceDim : colorScheme.surfaceDim,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.format_list_bulleted,
                                size: 16,
                                color: isHighlighted ? colorScheme.onSurface : colorScheme.onSurface,
                                shadows: [Shadow(color: colorScheme.onSurface.withValues(alpha: 0.7), offset: Offset(0.2, 0.2))],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 64,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.bar_chart_outlined,
                                size: 16,
                                color: isHighlighted ? colorScheme.onSurface : colorScheme.onSurface,
                                shadows: [Shadow(color: colorScheme.onSurface.withValues(alpha: 0.7), offset: Offset(0.2, 0.2))],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 64,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.timer,
                                size: 16,
                                color: isHighlighted ? colorScheme.onSurface : colorScheme.onSurface,
                                shadows: [Shadow(color: colorScheme.onSurface.withValues(alpha: 0.7), offset: Offset(0.2, 0.2))],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 64,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.timelapse,
                                size: 16,
                                color: isHighlighted ? colorScheme.onSurface : colorScheme.onSurface,
                                shadows: [Shadow(color: colorScheme.onSurface.withValues(alpha: 0.7), offset: Offset(0.2, 0.2))],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  ...List.generate(rotation.segments.length, (index) {
              
                    final segment = rotation.segments[index];
                    final selection = selectionMap[segment.selectionId]!;
                    
                    final isActive = isHighlighted && (activeSegmentIndex == index);
              
                    return Container(
                      color: index % 2 == 0 ? colorScheme.surfaceContainerHigh : colorScheme.surfaceContainerLow,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: RotationCardSegment(
                          isActive: isActive,
                          selection: selection,
                          energiesLabel: segment.energies.join("-"),
                          lengthLabel: "${segment.minutes} min",
                          durationLabel: segment.songDuration.label,
                          onPresetTap: onPresetSelected,
                        ),
                      ),
                    );
                  })
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}