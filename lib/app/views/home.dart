import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_context.dart';

import 'home_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopDevice) {
      return HomeMobile();
    }
    
    return const HomeMobile();
  }
}