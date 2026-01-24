import 'package:flutter/material.dart';
import 'package:qjay/widgets/control_slider/control_slider.dart';
import 'package:qjay/widgets/player_bar/player_bar_theme.dart';

class PlaybackTools extends StatelessWidget {
  final double volume; // 0..1
  final ValueChanged<double> onVolumeChanged;
  final IconData volumeIcon;

  const PlaybackTools({
    super.key,
    required this.volume,
    required this.onVolumeChanged,
    this.volumeIcon = Icons.volume_up,
  });

  @override
  Widget build(BuildContext context) {
    final pb = Theme.of(context).extension<PlayerBarTheme>() ?? PlayerBarTheme.fromBrightness(Theme.of(context).brightness);
    final clampedScale = MediaQuery.of(context).textScaleFactor;

    return SizedBox(
      width: pb.volumeWidth * clampedScale,
      child: ControlSlider(
        value: volume,
        onChanged: onVolumeChanged,
        icon: volumeIcon,
        iconTheme: pb.volumeIconTheme?.copyWith(size: pb.volumeIconTheme!.size * clampedScale),
        theme: pb.sliderTheme,
      ),
    );
  }
}
