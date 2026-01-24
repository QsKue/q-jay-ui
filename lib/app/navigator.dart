import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qjay/app/views/home.dart';
import 'package:qjay/app/views/not_found.dart';
import 'package:qjay/app/views/pinned.dart';
import 'package:qjay/app/views/schedule.dart';
import 'package:qjay/app/views/search.dart';
import 'package:qjay/app/views/selection.dart';
import 'package:qjay/app/views/settings.dart';

abstract class Routes {
  static const home = '/';
  static const signup = '/signup';
  static const search = '/search';
  static const schedule = '/schedule';
  static const selection = '/selection';
  static const pinned = '/pinned';
  static const settings = '/settings';
  static const notFound = '/404';
}

class RouteArgs {
  String? id;
  String? details;
  RouteArgs({ this.id, this.details });
}

// TODO: maybe add the store here too
class ContentNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> contentNavKey = GlobalKey<NavigatorState>();

  ContentNavigator({super.key});

  Widget buildPage(String name, Object? args) {
    final routeArgs = args is RouteArgs ? args : null;

    final id = routeArgs?.id;
    final details = routeArgs?.details;

    switch (name) {
      case Routes.home:
        return const HomePage();
      case Routes.signup:
        return const HomePage();
      case Routes.search:
        return const SearchPage();
      case Routes.schedule:
        return id == null ? HomePage() : SchedulePage(id: id);
      case Routes.selection:

        List<int>? energiesFrom(String? details) {
          if (details == null) return null;

          final out = <int>[];
          for (final part in details.split('-')) {
            final n = int.tryParse(part.trim());
            if (n == null) return null;
            out.add(n);
          }
          return out;
        }

        return id == null ? HomePage() : SelectionPage(id: id, energies: energiesFrom(details));
      case Routes.pinned:
        return const PinnedPage();
      case Routes.settings:
      default:
        return const SettingsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final navKey = contentNavKey;

    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        
        SystemNavigator.pop();
      },
      child: Navigator(
        key: navKey,
        initialRoute: Routes.home,
        onGenerateRoute: (RouteSettings settings) {
          final name = settings.name ?? Routes.home;
          final args = settings.arguments;

          // if (Theme.of(context).platform == TargetPlatform.iOS) {
          //   return CupertinoPageRoute(
          //     settings: settings,
          //     builder: (_) => buildPage(name, args),
          //   );
          // }

          return PageRouteBuilder(
            settings: settings,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
            pageBuilder: (_, __, ___) => buildPage(name, args),
          );
        },
        onUnknownRoute: (RouteSettings settings)
          => PageRouteBuilder(
            settings: settings,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
            pageBuilder: (_, __, ___) => const NotFoundPage(),
          ),
      ),
    );
  }
}