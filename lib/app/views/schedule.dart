import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/app/store/page_schedule_store.dart';
import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/app/views/schedule_view.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/presets.dart';

import 'schedule_compact.dart';

class SchedulePage extends StatelessWidget {
  final String id;

  const SchedulePage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    if (context.screenSize == ScreenSize.compact) {
      return const ScheduleCompact();
    }

    return AppShell(
      navIcon: QJay.qs_logo,
      body: ChangeNotifierProvider<SchedulePageStore>(
        create: (context) => SchedulePageStore(context.read<AppStore>().transport)..load(id),
        builder: (context, _) {
          final schedule = context.select<SchedulePageStore, Schedule?>((store) => store.schedule);
          
          if (schedule == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ScheduleView(schedule: schedule);
        },
      ),
      navigationIndex: 0,
    );
  }
}