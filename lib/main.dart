import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/app.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/transport/transport.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // top bar visible
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final transport = await createTransport();

  if ((Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    await windowManager.ensureInitialized();
    
    WindowOptions windowOptions = WindowOptions(
      size: Size(400, 1080),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setResizable(true);

      await windowManager.show();
      await windowManager.focus();
      await windowManager.center();
      // await windowManager.maximize();
    });
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStore>(
          create: (context) => AppStore(transport),
        ),
      ],
      child: MyApp(),
    )
  );
}
