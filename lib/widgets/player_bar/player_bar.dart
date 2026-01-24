import 'package:flutter/material.dart';

import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/widgets/player_bar/player_bar_controls.dart';
import 'package:qjay/widgets/player_bar/player_bar_theme.dart';
import 'package:qjay/widgets/player_bar/player_bar_tools.dart';
import 'package:qjay/widgets/track_info/track_info.dart';

// TODO: good refactors
// Use RepaintBoundary for the progress with select and an abstracted PlayerStore
// context.select<PlayerStore, ...>

class PlayerBar extends StatelessWidget {
  final PlayerBarTheme? theme;

  // Layout-derived values still exposed if you want to override per-instance
  final double? height;

  // Data
  final PresetType? presetInfo;
  final Song? song;

  // Navigation / actions
  final VoidCallback onView;
  final ValueChanged<Song> onDownvote;
  final ValueChanged<double> onSeek;

  // Playback
  final bool isPlaying;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onStop;
  final VoidCallback onNext;

  final double? progress;
  final Duration? runningTime;
  final Duration? remainingTime;

  // Volume
  final double volume;
  final ValueChanged<double> onVolumeChanged;

  const PlayerBar({
    super.key,
    this.theme,
    this.height,
    this.presetInfo,
    this.song,
    required this.onView,
    required this.onDownvote,
    required this.onSeek,
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
    required this.onStop,
    required this.onNext,
    this.progress,
    this.runningTime,
    this.remainingTime,
    required this.volume,
    required this.onVolumeChanged,
  }) : assert(volume >= 0 && volume <= 1, 'volume must be between 0 and 1');

  @override
  Widget build(BuildContext context) {
    final base = theme
      ?? Theme.of(context).extension<PlayerBarTheme>()
      ?? PlayerBarTheme.fromBrightness(Theme.of(context).brightness);

    final cs = Theme.of(context).colorScheme;
    final clampedScale = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      top: false,
      child: Container(
        height: (height ?? base.height) * clampedScale,
        decoration: BoxDecoration(
          color: base.backgroundColor ?? cs.surfaceContainerHigh,
          border: Border(top: BorderSide(color: base.borderColor ?? cs.outlineVariant)),
        ),
        padding: base.contentPadding,
        child: Row(
          children: [
            Expanded(child: TrackInfo(presetInfo: presetInfo, song: song, onView: onView)),
            const SizedBox(width: 16),
            SizedBox(width: base.centerWidthMax * clampedScale, child: Center(child: PlaybackControls(
              isPlaying: isPlaying,
              onPlay: onPlay,
              onPause: onPause,
              onStop: onStop,
              onNext: onNext,
              onDownvote: onDownvote,
              onSeek: onSeek,
              song: song,
              progress: progress,
              runningTime: runningTime,
              remainingTime: remainingTime,
            ))),
            const SizedBox(width: 16),
            Expanded(child: Align(
              alignment: Alignment.centerRight,
              child: PlaybackTools(volume: volume, onVolumeChanged: onVolumeChanged),
            )),
          ],
        ),
      ),
    );
  }
}
