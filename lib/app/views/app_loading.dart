import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_context.dart';

import 'app_loading_mobile.dart';

class AppLoadingPage extends StatelessWidget {
  final double progress;

  const AppLoadingPage({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopDevice) {
      return AppLoadingMobile(progress: progress);
    }
    
    return AppLoadingMobile(progress: progress);
  }
}