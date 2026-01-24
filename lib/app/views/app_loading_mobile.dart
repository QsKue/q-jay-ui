import 'package:flutter/material.dart';

import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/widgets/button/back_button.dart';

class AppLoadingMobile extends StatelessWidget {
  final double progress;

  const AppLoadingMobile({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: NavigationBackButton(icon: QJay.qs_logo, iconAlwaysVisible: true),
        titleSpacing: 0,
        title: Text("Loading", style: themeData.textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.bold,
        )),
      ),
    
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
                Text(
                  "Syncing data...",
                  textAlign: TextAlign.center,
                  
                  style: themeData.textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                    height: 2,
                  ),
                ),
              
              const SizedBox(height: 24),
              
              LinearProgressIndicator(
                backgroundColor: colorScheme.surfaceContainer,
                value: progress.clamp(0.0, 1.0)
              ),
            ]
          ),
        ),
      ),
    );
  }
}