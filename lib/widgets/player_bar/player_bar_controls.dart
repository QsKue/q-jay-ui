import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/rounded_button.dart';
import 'package:qjay/widgets/player_bar/player_bar_theme.dart';
import 'package:qjay/models/song.dart';

class PlaybackControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onStop;
  final VoidCallback onNext;
  final ValueChanged<Song> onDownvote;
  final ValueChanged<double> onSeek;
  final Song? song;
  final double? progress;
  final Duration? runningTime;
  final Duration? remainingTime;

  const PlaybackControls({
    super.key,
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
    required this.onStop,
    required this.onNext,
    required this.onDownvote,
    required this.onSeek,
    required this.song,
    required this.progress,
    required this.runningTime,
    required this.remainingTime,
  });

  String _fmt(Duration? d) {
    if (d == null) return '';
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
    }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pb = theme.extension<PlayerBarTheme>() ?? PlayerBarTheme.fromBrightness(theme.brightness);
    final clampedScale = MediaQuery.of(context).textScaleFactor;

    final primaryBtn = pb.primaryButtonTheme;
    final smallBtn = pb.smallButtonTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: pb.centerWidthMax * clampedScale),
      child: ClipRect(
        clipBehavior: Clip.antiAlias, // TODO fix overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: pb.controlClusterPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: runningTime == null ? SizedBox() : Text(_fmt(runningTime), style: theme.textTheme.labelSmall, textAlign: TextAlign.left),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RoundedButton(
                        icon: Icons.stop,
                        tooltip: 'Stop',
                        onPressed: onStop,
                        theme: smallBtn?.copyWith(size: smallBtn.size *clampedScale, iconSize: smallBtn.iconSize * clampedScale),
                      ),
                      SizedBox(width: 8 * clampedScale),
                      RoundedButton(
                        icon: isPlaying ? Icons.pause : Icons.play_arrow,
                        tooltip: isPlaying ? 'Pause' : 'Play',
                        onPressed: isPlaying ? onPause : onPlay,
                        theme: primaryBtn?.copyWith(size: primaryBtn.size *clampedScale, iconSize: primaryBtn.iconSize * clampedScale),
                      ),
                      SizedBox(width: 8 * clampedScale),
                      RoundedButton(
                        icon: Icons.skip_next,
                        tooltip: 'Next',
                        onPressed: onNext,
                        theme: smallBtn?.copyWith(size: smallBtn.size *clampedScale, iconSize: smallBtn.iconSize * clampedScale),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16 * clampedScale, 0, 0, 4 * clampedScale),
                          child: RoundedButton(
                            icon: Icons.block,
                            tooltip: 'Downvote',
                            onPressed: song == null ? null : () => onDownvote(song!),
                            theme: smallBtn?.copyWith(size: smallBtn.size *clampedScale, iconSize: smallBtn.iconSize * clampedScale),
                          ),
                        ),
        
                        if (remainingTime != null)
                          Text(_fmt(remainingTime), style: theme.textTheme.labelSmall, textAlign: TextAlign.right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                void handleSeek(Offset localPos) {
                  final w = constraints.maxWidth;
                  if (w <= 0) return;
                  final x = localPos.dx.clamp(0.0, w);
                  final p = (x / w).clamp(0.0, 1.0);
                  onSeek.call(p);
                }
        
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (d) => handleSeek(d.localPosition),
                  onHorizontalDragStart: (d) => handleSeek(d.localPosition),
                  onHorizontalDragUpdate: (d) => handleSeek(d.localPosition),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: (progress == null) ? 0.0 : progress!.clamp(0.0, 1.0),
                        minHeight: pb.progressHeight,
                        backgroundColor: pb.progressIndicatorBackgroundColor,
                        color: pb.progressIndicatorForegroundColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
