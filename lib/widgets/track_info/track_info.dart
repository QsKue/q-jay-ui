import 'package:flutter/material.dart';

import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/widgets/player_bar/player_bar_theme.dart';
import 'package:qjay/widgets/button/hover_icon.dart';
import 'package:qjay/widgets/track_info/track_info_theme.dart';

class TrackInfo extends StatefulWidget {
  final PresetType? presetInfo;
  final Song? song;
  final VoidCallback onView;

  const TrackInfo({
    super.key,
    required this.presetInfo,
    required this.song,
    required this.onView,
  });

  @override
  State<TrackInfo> createState() => _TrackInfoState();
}

class _TrackInfoState extends State<TrackInfo> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final pb = theme.extension<PlayerBarTheme>() ?? PlayerBarTheme.fromBrightness(theme.brightness);
    final ti = pb.trackInfoTheme ?? const TrackInfoTheme();
    final clampedScale = MediaQuery.of(context).textScaleFactor;

    final sel = widget.presetInfo;
    final song = widget.song;

    final bgColor = ti.iconBackgroundColor ?? cs.primaryContainer;
    final hoverBlend = ti.iconHoverBlendColor ?? cs.primary.withOpacity(0.08);
    final fg = ti.iconForegroundColor ?? cs.onPrimaryContainer;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(4.0 * clampedScale),
          child: MouseRegion(
            onEnter: (_) => setState(() => _hover = true),
            onExit: (_) => setState(() => _hover = false),
            child: AnimatedContainer(
              duration: ti.animationDuration,
              curve: ti.animationCurve,
              width: ti.iconSize * clampedScale,
              height: ti.iconSize * clampedScale,
              margin: ti.iconMargin,
              transform: Matrix4.identity()..scale(_hover ? ti.iconHoverScale : 1.0),
              decoration: BoxDecoration(
                color: _hover ? Color.alphaBlend(hoverBlend, bgColor) : bgColor,
                borderRadius: BorderRadius.circular(ti.iconCornerRadius),
              ),
              child: (sel != null)
                ? Center(
                    child: HoverIcon(
                      icon: sel.icon,
                      theme: ti.iconButtonTheme?.copyWith(
                        color: fg,
                        hoverColor: fg,
                        size: ti.iconSize * clampedScale,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: widget.onView,
                    ),
                  )
                : null,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(song?.title ?? '', style: ti.titleStyle ?? theme.textTheme.labelSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text(song?.artist ?? '', style: ti.artistStyle ?? theme.textTheme.labelMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     sel != null ? '${sel.category} - ${sel.name}' : '',
              //     style: ti.presetLineStyle ?? theme.textTheme.labelLarge?.copyWith(color: cs.primary),
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
