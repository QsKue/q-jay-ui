import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_context.dart';

import 'settings_mobile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopDevice) {
      return SettingsMobile();
    }
      
    return SettingsMobile();
  }
}