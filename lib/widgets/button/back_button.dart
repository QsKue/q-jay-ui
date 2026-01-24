import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/navigator.dart';
import 'package:qjay/app/store/navigation_store.dart';

class NavigationBackButton extends StatelessWidget {
  final IconData? icon;
  final bool iconAlwaysVisible;
  final Function()? onPressed;

  const NavigationBackButton({
    super.key,
    this.icon,
    this.iconAlwaysVisible = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final showBack = !iconAlwaysVisible && canPop;

    return IconButtonTheme(
      data: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(colorScheme.onSurfaceVariant),
        ),
      ),
      child: Center(
        child: IconButton(
          iconSize: showBack ? 28 : 28,
          icon: Icon(showBack || icon == null ? Icons.arrow_back_rounded : icon!),
          onPressed: onPressed ?? () {
            if (showBack) {
              context.read<NavigationStore>().gotoPage(context, Routes.home);
            }
          },
        ),
      ),
    );
  }
}
