import 'package:flutter/material.dart';

import 'package:qjay/app/navigator.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/transport.dart';

class NavigationStore with ChangeNotifier {
  final Transport _transport;

  NavigationStore(this._transport, List<Preset> presets)
    : _selectionMap = Map.fromEntries(presets.whereType<Selection>().map((preset) => MapEntry(preset.id, preset)));

  String? _lastPushedPresetId;
  String? get currentPresetId => _lastPushedPresetId;

  Map<String, Selection> _selectionMap;
  Map<String, Selection> get selectionMap => _selectionMap;

  void gotoPage(BuildContext context, String route, [String? id, String? details]) {
    final currentRouteSettings = ModalRoute.of(context)?.settings;
    if ((currentRouteSettings?.name == route) && (currentRouteSettings?.arguments == id)) {
      return;
    }
    
    _lastPushedPresetId = id;
    notifyListeners();
    
    _transport.clearRequests();
    if (route == Routes.home) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        route,
        (Route<dynamic> route) => false,
        arguments: id,
      );
    } else {
      Navigator.of(context).pushNamed(route, arguments: RouteArgs(id: id, details: details));
    }
  }

  void gotoPreset(BuildContext context, Preset preset) {
    gotoPage(context, preset.route, preset.id);
  }

  void setPreset(Preset preset) {
    switch (preset) {
      case Schedule():
        _transport.setSchedule(preset.id);
        break;
      case Selection():
        _transport.setSelection(preset.id, null, preset.defaultEnergies, SongDuration.fullLength);
      case UserPlaylist():
        throw UnimplementedError();
    }
  }
}