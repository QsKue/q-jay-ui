import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';

extension OnboardingStepHelpers on OnboardingStep {
  String title() => switch (this) {
    OnboardingStep.clientSetup => "Setup",
    OnboardingStep.loading => "Loading",
    OnboardingStep.updateDatabase => "Update",
    OnboardingStep.error => "Error",
    OnboardingStep.done => "Finished",
  };
}

class OnboardingPage extends StatefulWidget {
  final Transport transport;

  const OnboardingPage({
    super.key,
    required this.transport,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final store = context.read<AppStore>();
    final state = context.select<AppStore, AppState>((store) => store.state);
    
    final onboardingState = state is OnboardingState ? state.state : OnboardingStep.clientSetup;
    final isUserSetup = onboardingState == OnboardingStep.clientSetup;
    final userCanSubmit = context.select<AppStore, bool>((store) => store.userCanSubmit);

    final updaterEvent = context.select<AppStore, UpdaterEvent?>((store) => store.updaterEvent);
    
    return AppShell(
      shellMode: ShellMode.empty,
      navIcon: isUserSetup ? QJay.qs_logo : Icons.arrow_back_ios_new_rounded,
      navAction: store.onboardingGoBack,
      title: Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Text(onboardingState.title(), style: themeData.textTheme.headlineSmall?.copyWith(
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
                onboardingState == OnboardingStep.clientSetup ? "Please Input Details" : "Settings things up",
                textAlign: TextAlign.center,
                
                style: themeData.textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onSurface,
                  
                  height: 2,
                ),
              ),

              const SizedBox(height: 16),

              if (onboardingState == OnboardingStep.clientSetup) ...[
                TextField(
                  
                  style: themeData.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Your ID',
                    border: OutlineInputBorder(),
                    labelStyle: themeData.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                  ),
                  onChanged: (value) => store.setClientDetails(userId: value),
                ),

                const SizedBox(height: 16),

                TextField(
                  style: themeData.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    labelText: 'Your name',
                    border: OutlineInputBorder(),
                    labelStyle: themeData.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                  ),
                  onChanged: (value) => store.setClientDetails(userName: value),
                ),

                const SizedBox(height: 24),

                FilledButton(
                  onPressed: !userCanSubmit ? null : store.setupClient,
                  child: const Text('Continue'),
                ),
              ] else ...[

                Text(
                  updaterEvent?.message ?? "Loading...",
                  textAlign: TextAlign.center,
                  
                  style: themeData.textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                    
                    height: 2,
                  ),
                ),

                const SizedBox(height: 24),

                LinearProgressIndicator(
                  backgroundColor: colorScheme.surfaceContainer,
                  value: updaterEvent?.eventProgress,
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: updaterEvent?.hasRetry ?? false ? store.retryUpdate : null, child: const Text('Retry')),
                    TextButton(
                      onPressed: () => {
                        store.onboardingGoBack(),
                      },
                      child: const Text('Cancel')
                    ),
                  ],
                ),
              ]
            ]
          ),
        ),
      ),
    );
  }
}