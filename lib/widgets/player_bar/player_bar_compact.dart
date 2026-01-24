import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qjay/app/store/navigation_store.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/models/song.dart';

class PlayerBarCompact extends StatefulWidget {

  const PlayerBarCompact({super.key});

  @override
  State<PlayerBarCompact> createState() => _PlayerBarCompactState();
}

class _PlayerBarCompactState extends State<PlayerBarCompact> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final isPlaying = context.select<PlayerStore, bool>((store) => store.playerState == PlayerState.playing);
    final isPinned = context.select<PlayerStore, bool>((store) => store.currentSong?.pinned ?? false);
    final currentSong = context.select<PlayerStore, Song?>((store) => store.currentSong);

    final runningTime = context.select<PlayerStore, Duration?> ((store) => store.runningTime);
    final totalTime = context.select<PlayerStore, Duration?> ((store) => store.totalTime);
    final double progress = runningTime == null || totalTime == null ? 0 : runningTime.inSeconds.toDouble() / totalTime.inSeconds.toDouble();

    if (progress < 0) {
      _progress = null;
    }

    return SliderTheme(
      data: SliderThemeData(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
        trackHeight: 8,
        trackShape: RoundedRectSliderTrackShape(),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
      ),
      child: IconButtonTheme(
        data: IconButtonThemeData(
          style: IconButtonTheme.of(context).style?.copyWith(
            iconSize: WidgetStatePropertyAll(32),
            iconColor: WidgetStateColor.fromMap(<WidgetStatesConstraint, Color>{
              WidgetState.error: colorScheme.error,
              WidgetState.hovered & WidgetState.focused: colorScheme.primary.withValues(alpha: 0.3),
              WidgetState.pressed: colorScheme.primary,
              WidgetState.selected: colorScheme.primary,
              WidgetState.any: colorScheme.onTertiary,
            }),
          ),
        ),
        child: IconTheme(
          data: IconTheme.of(context).copyWith(
            size: 32,
            shadows: [Shadow(color: colorScheme.primary.withValues(alpha: 0.3), offset: Offset(0.8, 0.8))],
          ),
          child: Container(
            padding: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              color: colorScheme.tertiary,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                  
                      IconButton(  
                        icon: Icon(isPinned ? Icons.playlist_add_check_rounded : Icons.playlist_add_rounded),
                        isSelected: isPinned,
                        onPressed: () {
                          if (currentSong != null) {
                            if (isPinned) {
                              context.read<PinnedPageStore>().removePinnedSong(currentSong.id);
                            } else {
                              context.read<PinnedPageStore>().addPinnedSong(currentSong);
                            }
                          }
                        },
                      ),
          
                      SizedBox(width: 4),
                  
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final (currentPresetType, currentPreset) = context.read<PlayerStore>().currentPreset ?? (null, null);
                            final currentPresetDetails = context.read<PlayerStore>().currentPresetDetails;
                            
                            if ((currentPresetType != null) && (currentPreset != null)) {
                              context.read<NavigationStore>().gotoPage(context, currentPresetType.route, currentPreset, currentPresetDetails?.join('-'));
                            }
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                                
                                if (currentSong != null) ...[
                                  Text(
                                    currentSong.title,
                                    style: themeData.textTheme.labelLarge?.copyWith(
                                      color: colorScheme.onTertiary,
                                      fontWeight: FontWeight.bold,
                                      shadows: [Shadow(color: colorScheme.primary.withValues(alpha: 0.3), offset: Offset(0.2, 0.2))],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                  Text(
                                    currentSong.artist,
                                    style: themeData.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onTertiary,
                                      shadows: [Shadow(color: colorScheme.primary.withValues(alpha: 0.3), offset: Offset(0.4, 0.4))],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      ),
                  
                      IconButton(
                        icon: Icon(Icons.stop_rounded),
                        onPressed: () => context.read<PlayerStore>().stop(),
                      ),
                  
                      IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                        onPressed: () => isPlaying ? context.read<PlayerStore>().pause() : context.read<PlayerStore>().play(),
                      ),
                  
                      IconButton(  
                        icon: Icon(Icons.skip_next_rounded),
                        onPressed: () => context.read<PlayerStore>().next(),
                      ),
                    ],
                  ),
                ),
                
                progress < 0 ?
                  Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(12, 8, 12, 8),
                    child: LinearProgressIndicator(
                      backgroundColor: colorScheme.surfaceContainer.withValues(alpha: 0.92),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                :
                  Slider(
                    value: (_progress ?? progress).clamp(0.0, 1.0),
                    onChanged: (progress) => setState(() => _progress = progress),
                    onChangeEnd: (progress) {
                      context.read<PlayerStore>().setProgress(progress);
                      Future.delayed(Duration(milliseconds: 800)).then((_) {
                        if (!mounted) return;
                        setState(() => _progress = null);
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}