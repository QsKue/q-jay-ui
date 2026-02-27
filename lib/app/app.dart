import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/navigator.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/app/store/nav_rail_store.dart';
import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/app/theme/app_responsive_scope.dart';
import 'package:qjay/app/theme/app_theme.dart';
import 'package:qjay/app/theme/theme_controller.dart';
import 'package:qjay/app/views/app_loading.dart';
import 'package:qjay/app/views/connect.dart';
import 'package:qjay/app/views/onboarding.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/widgets/resize_grip.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> tempKey = GlobalKey();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final _themeController = ThemeController(ScaleFactor.extraLarge);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<AppStore>().reconnect();
      context.read<PlayerStore>().updateCurrentSong();
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = ResponsiveScope(
      child: Builder(
        builder: (context) {
          final themeData = Theme.of(context);
          final colorScheme = ColorScheme.of(context);

          final themes = buildAdaptiveLightDarkForWidth(context);

          final state = context.select<AppStore, AppState>((store) => store.state);
          final transport = context.select<AppStore, Transport>((store) => store.transport);

          return AnimatedBuilder(
            animation: _themeController,
            builder: (_, __) {
              return MaterialApp(
                title: 'Q-Jay',
                navigatorKey: MyApp.tempKey,

                debugShowCheckedModeBanner: false,

                theme: themes.light,
                darkTheme: themes.dark,
                themeMode: _themeController.themeMode,

                builder: (context, child) {
                  return Stack(
                    children: [
                      child ?? const SizedBox(),
                      if ((Platform.isWindows || Platform.isLinux || Platform.isMacOS))
                        const ResizeGripBR(),
                    ],
                  );
                },
                home: SafeArea(
                  child: Column(
                    children: [
                      if (transport.isMock) ...[
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                          child: Row(
                            spacing: 4,
                            children: [
                          
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: colorScheme.primaryContainer,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: context.read<AppStore>().stubOnboarding,
                                child: Text("Onboard", style: themeData.textTheme.labelSmall?.copyWith(color: colorScheme.onSurface)),
                              ),
                              
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: colorScheme.primaryContainer,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: context.read<AppStore>().stubConnect,
                                child: Text("Connect", style: themeData.textTheme.labelSmall?.copyWith(color: colorScheme.onSurface)),
                              ),
                          
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: colorScheme.primaryContainer,
                                  foregroundColor: colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: context.read<AppStore>().stubHome,
                                child: Text("Home", style: themeData.textTheme.labelSmall?.copyWith(color: colorScheme.onSurface)),
                              ),
                            ],
                          ),
                        )
                      ],

                      if (mounted)
                        Expanded(
                          child: switch (state) {
                            SplashState() => const Center(child: CircularProgressIndicator()),
                            ConnectState(:var withError) => ConnectPage(transport: transport, status: withError ? ConnectionStatus.appError : null),
                            SyncincState() => AppLoadingPage(progress: state.progress),
                            OnboardingState() => OnboardingPage(transport: transport),
                            NavigationState() => MultiProvider(
                              providers: [
                                ChangeNotifierProvider<NavigationStore>(
                                  create: (_) => NavigationStore(transport, state.presets),
                                ),
                                ChangeNotifierProvider<NavRailStore>(
                                  create: (_) => NavRailStore(transport, state.presets)..load(),
                                ),
                                ChangeNotifierProvider<PinnedPageStore>(
                                  create: (_) => PinnedPageStore(transport)..load(),
                                ),
                                ChangeNotifierProvider<PlayerStore>(
                                  create: (_) => PlayerStore(transport)..load(),
                                ),
                                ChangeNotifierProvider<SearchPageStore>(
                                  create: (context) => SearchPageStore(transport)..load(),
                                )
                              ],
                              child: ContentNavigator(),
                            )
                          },
                        ),
                    ]
                  )
                ),
              );
            },
          );
        },
      ),
    );

    return ThemeControllerScope(
      controller: _themeController,
      child: content,
    );
  }
}