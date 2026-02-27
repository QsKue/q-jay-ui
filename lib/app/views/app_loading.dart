import 'package:flutter/material.dart';

import 'app_loading_mobile.dart';

class AppLoadingPage extends StatelessWidget {
  final double progress;

  const AppLoadingPage({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return AppLoadingMobile(progress: progress);
  }
}