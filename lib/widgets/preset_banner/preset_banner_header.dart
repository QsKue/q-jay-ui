import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon.dart';

import 'preset_banner_theme.dart';

class PresetBannerHeader extends StatelessWidget {
  final PresetBannerHeaderThemeData? theme;

  final IconData? icon;
  final String? header;
  final VoidCallback? onHeaderIconPressed;

  const PresetBannerHeader({
    super.key,
    this.theme,
    this.icon,
    this.onHeaderIconPressed,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    final t = theme ?? PresetBannerHeaderTheme.of(context) ?? PresetBannerHeaderThemeData.base(context);

    return Padding(
      padding: t.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            HoverIcon(
              icon: icon!,
              onPressed: onHeaderIconPressed,
            ),
          if (icon != null) SizedBox(width: t.spacing),
          if (header?.isNotEmpty ?? false)
            Expanded(
              child: Text(
                header!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: t.textStyle,
              ),
            ),
        ],
      ),
    );
  }
}
