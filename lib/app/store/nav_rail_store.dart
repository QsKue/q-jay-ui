import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:qjay/models/presets.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';

class NavRailStore extends ChangeNotifier {
  final Transport _transport;
  
  NavRailStore(this._transport, this._presets)
    : _filters = {for (var preset in _presets) preset.type }.toList();

  List<PresetType> _filters;
  List<PresetType> get filters => _filters;
  final HashSet<PresetType> _activeFilters = HashSet();
  HashSet<PresetType> get activeFilters => _activeFilters;

  Preset? _currentPreset;
  Preset? get currentPreset => _currentPreset;

  List<Preset> _presets;
  List<Preset> get presets => _presets.where((preset) =>
    _activeFilters.isEmpty || _activeFilters.contains(preset.type)
  ).toList();

  StreamSubscription<TransportEvent>? _sub;

  void load() {
    _sub?.cancel();
    _sub = _transport.eventStream.listen((event) {
      switch (event) {
        case TransportEventScheduleUpdated():
          _currentPreset = _presets.firstWhere((preset) => preset.id == event.scheduleId);
          
          notifyListeners();
          break;
        case TransportEventSelectionUpdated():
          _currentPreset = _presets.firstWhere((preset) => preset.id == event.selectionId);

          notifyListeners();
          break;
        default:
          break;
      }
    });
  }
  
  void activateFilter(PresetType filter) {
    if (_activeFilters.contains(filter)) return;
    
    _activeFilters.add(filter);
    if (_activeFilters.length == _filters.length) {
      _activeFilters.clear();
    }
    
    notifyListeners();
  }

  void deactivateFilter(PresetType filter) {
    if (!_activeFilters.contains(filter)) return;
    
    _activeFilters.remove(filter);
    notifyListeners();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}