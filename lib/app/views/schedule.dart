import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qjay/app/store/app_store.dart';

import 'package:qjay/app/store/page_schedule_store.dart';

import 'schedule_mobile.dart';

class SchedulePage extends StatelessWidget {
  final String id;

  const SchedulePage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SchedulePageStore>(
      create: (context) => SchedulePageStore(context.read<AppStore>().transport)..load(id),
      builder: (context, _) {
        return ScheduleMobile();
      },
    );
  }
}