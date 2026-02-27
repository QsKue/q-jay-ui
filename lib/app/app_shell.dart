import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/back_button.dart';
import 'package:window_manager/window_manager.dart';

class AppShell extends StatelessWidget {

  final IconData? navIcon;
  final bool? navIconAlwaysVisible;
  final VoidCallback? navAction;

  final Widget title;
  final Widget body;

  const AppShell({
    super.key,
    this.navIcon,
    this.navIconAlwaysVisible,
    this.navAction,
    required this.title,
    required this.body,
  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NavigationBackButton(icon: navIcon, onPressed: navAction, iconAlwaysVisible: navIconAlwaysVisible ?? false),
        titleSpacing: 0,
        title: title,
        actions: [
          if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) ...[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => windowManager.minimize(),
            ),
            IconButton(
              icon: const Icon(Icons.crop_square),
              onPressed: () async {
                if (await windowManager.isMaximized()) {
                  await windowManager.unmaximize();
                } else {
                  await windowManager.maximize();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => windowManager.close(),
            ),
          ],
        ],
      ),
      body: body,
    );
  }
}