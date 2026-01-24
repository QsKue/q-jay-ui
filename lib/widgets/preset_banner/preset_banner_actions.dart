import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon.dart';
import 'package:qjay/widgets/button/rounded_button.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_theme.dart';

class PresetBannerActionBar extends StatelessWidget {
  final PresetBannerThemeDataLegacy? theme;
  final PresetBarsThemeDataLegacy? barTheme;

  final VoidCallback onPlay;
  final VoidCallback? onEdit;
  final VoidCallback? onSongDuration;

  final bool showDisabled;

  const PresetBannerActionBar({
    super.key,
    required this.onPlay,
    this.onEdit,
    this.onSongDuration,
    this.theme,
    this.barTheme,
    this.showDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final th = theme ?? PresetBannerThemeLegacy.of(context) ?? PresetBannerThemeDataLegacy.base(context);

    return Padding(
      padding: th.actionsPadding,
      child: Row(
        children: [
          RoundedButton(
            icon: Icons.play_arrow,
            tooltip: 'Play',
            onPressed: onPlay,
            hovered: false,
            theme: th.playButtonTheme,
          ),
          if (onEdit != null || showDisabled) ...[
            SizedBox(width: th.actionButtonsSpacing),
            HoverIcon(
              icon: Icons.edit,
              hintText: 'Edit',
              onPressed: onEdit ?? (showDisabled ? null : () {}),
              theme: th.otherButtonsTheme,
            ),
          ],
          if (onSongDuration != null || showDisabled) ...[
            SizedBox(width: th.actionButtonsSpacing),
            HoverIcon(
              icon: Icons.timelapse,
              hintText: 'Song Duration',
              onPressed: onSongDuration ?? (showDisabled ? null : () {}),
              theme: th.otherButtonsTheme,
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
