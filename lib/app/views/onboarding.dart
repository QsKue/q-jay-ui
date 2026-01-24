import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/transport/transport.dart';

import 'onboarding_mobile.dart';

class OnboardingPage extends StatelessWidget {
  final Transport transport;

  const OnboardingPage({
    super.key,
    required this.transport,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopDevice) {
      return OnboardingMobile(transport: transport);
    }
    
    return OnboardingMobile(transport: transport);
  }
}