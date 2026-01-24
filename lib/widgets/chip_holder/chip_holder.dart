import 'dart:collection';
import 'package:flutter/material.dart';

import 'chip_holder_theme.dart';

class ChipHolder<T> extends StatelessWidget {
  final ChipHolderTheme? theme;

  final Widget? header;
  final List<T> items;
  final HashSet<T> activeItems;
  final ValueChanged<T> onActivate;
  final ValueChanged<T> onDeactivate;

  final Color? activeBackgroundColor;
  final Color? activeForegroundColor;
  final Color? activeBorderColor;
  final Color? inactiveBackgroundColor;
  final Color? inactiveForegroundColor;
  final Color? inactiveBorderColor;

  final String Function(T value)? labelBuilder;
  final Widget Function(BuildContext context, T value, bool isActive)? itemBuilder;

  const ChipHolder({
    super.key,
    this.theme,
    this.header,
    required this.items,
    required this.activeItems,
    required this.onActivate,
    required this.onDeactivate,
    this.activeBackgroundColor,
    this.activeForegroundColor,
    this.activeBorderColor,
    this.inactiveBackgroundColor,
    this.inactiveForegroundColor,
    this.inactiveBorderColor,
    this.labelBuilder,
    this.itemBuilder,
  }) : assert(
    itemBuilder != null || labelBuilder != null,
    'Provide either itemBuilder or labelBuilder to render each chip',
  );

  @override
  Widget build(BuildContext context) {
    final chipTheme = theme
      ?? Theme.of(context).extension<ChipHolderTheme>()
      ?? ChipHolderTheme();

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    return Padding(
      padding: chipTheme.gutterPadding,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.start,
        clipBehavior: Clip.none,
        spacing: chipTheme.spacing,
        runSpacing: chipTheme.runSpacing,
        children: [

          if (header != null)
            header!,
          
          ...items.map((item) {
            final isActive = activeItems.contains(item);
        
            return InkWell(
              borderRadius: chipTheme.borderRadius,
              onTap: () {
                if (isActive) {
                  onDeactivate(item);
                } else {
                  onActivate(item);
                }
              },
              child: Material(
                type: MaterialType.transparency,
                child: Container( 
                  padding: chipTheme.chipPadding,
                  constraints: BoxConstraints(minWidth: chipTheme.minWidth),
                  decoration: BoxDecoration(
                    borderRadius: chipTheme.borderRadius,
                    color: isActive
                      ? activeBackgroundColor ?? chipTheme.activeBackgroundColor ?? colorScheme.primaryContainer
                      : inactiveBackgroundColor ?? chipTheme.inactiveBackgroundColor ?? Colors.transparent,
                    border: Border.fromBorderSide(BorderSide(
                      color: isActive
                        ? activeBorderColor ?? chipTheme.activeBorderColor ?? colorScheme.onPrimaryContainer.withValues(alpha: 0.2)
                        : inactiveBorderColor ?? chipTheme.inactiveBorderColor ?? colorScheme.onSurface.withValues(alpha: 0.4),
                      width: chipTheme.borderWidth
                    )),
                  ),
                  child: itemBuilder != null
                    ? itemBuilder!(context, item, isActive)
                    : Text(
                      labelBuilder!(item),
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: isActive
                        ? chipTheme.activeTextStyle ?? themeData.textTheme.labelLarge?.copyWith(color: activeForegroundColor ?? colorScheme.onPrimaryContainer)
                        : chipTheme.inactiveTextStyle ?? themeData.textTheme.labelLarge?.copyWith(color: inactiveForegroundColor ?? colorScheme.onSurface),
                    )
                ),
              ),
            );
          }),
        ]
      ),
    );
  }
}