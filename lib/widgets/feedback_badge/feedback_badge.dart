import 'package:flutter/material.dart';

import 'feedback_badge_theme.dart';

class FeedbackBadge extends StatelessWidget {
  const FeedbackBadge({
    super.key,
    required this.name,
    this.theme,
  });

  final String name;
  final FeedbackBadgeThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final t = theme ?? FeedbackBadgeTheme.of(context) ?? FeedbackBadgeThemeData.base(context);

    final textStyle = t.badgeTextStyle ?? Theme.of(context).textTheme.bodyMedium;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: t.badgeHorizontalPadding,
          vertical: t.badgeVerticalPadding,
        ),
        decoration: BoxDecoration(
          color: t.badgeBackgroundColor,
          borderRadius: BorderRadius.circular(t.badgeCornerRadius),
        ),
        child: SizedBox(
          width: t.badgeMaxWidth,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}