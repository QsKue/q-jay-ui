import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';
import 'package:qjay/widgets/control_slider/control_slider_theme.dart';

class ControlSlider extends StatelessWidget {
  final double value; // 0..1
  final ValueChanged<double> onChanged;
  final IconData icon;
  final HoverIconTheme? iconTheme;
  final ControlSliderTheme? theme;

  const ControlSlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.icon,
    this.iconTheme,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final t = theme ??
        Theme.of(context).extension<ControlSliderTheme>() ??
        ControlSliderTheme(
          trackHeight: 6,
          thumbRadius: 8,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          thumbColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8),
        );

    final iconTheming = iconTheme ?? Theme.of(context).extension<HoverIconTheme>();

    return Padding(
      padding: t.padding,
      child: Row(
        children: [
          HoverIcon(icon: icon, theme: iconTheming, onPressed: null),
          const SizedBox(width: 8),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: t.trackHeight,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: t.thumbRadius),
                activeTrackColor: t.activeColor,
                inactiveTrackColor: t.inactiveColor,
                thumbColor: t.thumbColor,
                overlayShape: SliderComponentShape.noThumb, // tight UI
              ),
              child: Slider(
                value: value.clamp(0, 1),
                onChanged: onChanged,
                min: 0,
                max: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
