import 'dart:math' show max;

import 'package:flutter/material.dart';

import 'package:qjay/models/song.dart';

import 'preset_banner_actions.dart';
import 'preset_banner_energy.dart';
import 'preset_banner_theme.dart';

class PresetBannerSelection extends StatefulWidget {
  final PresetBannerSelectionTheme? theme;

  final VoidCallback? onPlay;
  final VoidCallback? onEdit;
  final VoidCallback? onSongDuration;

  final List<int> currentEnergies;
  final List<int> groupings;
  final List<int> energies;
  final List<int> defaultEnergies;
  final SongDuration defaultSongDuration;

  final void Function(List<int> selectedEnergies, SongDuration songDuration)? onSelectionChanged;

  PresetBannerSelection({
    super.key,
    this.theme,
    this.onPlay,
    this.onEdit,
    this.onSongDuration,
    required this.currentEnergies,
    List<int>? groupings,
    required this.energies,
    required this.defaultEnergies,
    this.defaultSongDuration = SongDuration.fullLength,
    this.onSelectionChanged,
  }) : groupings = groupings ?? List<int>.generate(energies.length, (i) => i + 1) {
    if (energies.isEmpty) throw ArgumentError('energies cannot be empty');

    if (defaultEnergies.isEmpty) throw ArgumentError('defaultEnergies cannot be empty');

    if (!energies.toSet().containsAll(defaultEnergies)) {
      throw ArgumentError('defaultEnergies must be a subset of energies');
    }

    if (this.groupings.isEmpty || this.groupings.any((g) => g < 1 || g > energies.length)) {
      throw ArgumentError('groupings must be within 1..energies.length');
    }
  }

  @override
  State<PresetBannerSelection> createState() => _PresetBannerSelectionState();
}

class _PresetBannerSelectionState extends State<PresetBannerSelection> {
  late SongDuration _songDuration;
  late List<int> _selectedEnergies;

  int get _currentGrouping => _selectedEnergies.length;
  bool get _isAll => _currentGrouping == widget.energies.length;

  @override
  void initState() {
    super.initState();
    _selectedEnergies = List<int>.from(widget.defaultEnergies);
    _songDuration = widget.defaultSongDuration;
  }

  List<List<int>> _windowsFor(int grouping) {
    final availableEnergies = widget.energies;
    if (grouping <= 0 || availableEnergies.length < grouping) return const [];
    return List.generate(
      availableEnergies.length - grouping + 1,
      (i) => availableEnergies.sublist(i, i + grouping),
    );
  }

  void _setGrouping(int grouping) {
    setState(() {
      if (grouping >= widget.energies.length) {
        _selectedEnergies = List<int>.from(widget.energies);
      } else {
        final windows = _windowsFor(grouping);
        final bestIndex = (windows.length / 2).floor() - (windows.length % 2 == 0 ? 1 : 0);
        _selectedEnergies = windows[max(bestIndex, 0)];
      }
      widget.onSelectionChanged?.call(_selectedEnergies, _songDuration);
    });
  }

  void _setSelectedEnergies(List<int> values) {
    setState(() {
      _selectedEnergies = values;
      widget.onSelectionChanged?.call(_selectedEnergies, _songDuration);
    });
  }

  int _selectedWindowIndex(List<List<int>> windows) {
    for (var i = 0; i < windows.length; i++) {
      final w = windows[i];
      if (w.length == _selectedEnergies.length) {
        bool same = true;
        for (var j = 0; j < w.length; j++) {
          if (w[j] != _selectedEnergies[j]) {
            same = false;
            break;
          }
        }
        if (same) return i;
      }
    }
    return -1;
  }

  String _windowLabel(List<int> w) => w.join('-');

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<PresetBannerSelectionTheme>()
      ?? PresetBannerSelectionTheme();

    final colorScheme = ColorScheme.of(context);

    final groupings = widget.groupings;
    final groupingIndex = groupings.indexWhere((g) => g == _currentGrouping);

    final windows = _isAll ? const <List<int>>[] : _windowsFor(_currentGrouping);
    final windowIndex = _isAll ? -1 : _selectedWindowIndex(windows);
    
    return Container(
      color: theme.backgroundColor ?? colorScheme.surface,
      child: Padding(
        padding: theme.gutterPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            if (widget.onPlay != null)
              PresetBannerActionBar(
                onPlay: widget.onPlay!,
                onEdit: widget.onEdit,
                onSongDuration: widget.onSongDuration,
              ),

            PresetBannerEnergyBar(
              currentGrouping: widget.currentEnergies.length,
              currentEnergies: widget.currentEnergies,
              groupingItems: [for (final g in groupings) g == widget.energies.length ? 'All' : g.toString()],
              energyItems: windows.map(_windowLabel).toList(),
              groupingSelectedIndex: groupingIndex,
              energySelectedIndex: windowIndex,
              onGroupingTapIndex: (i) => _setGrouping(groupings[i]),
              onEnergyTapIndex: (i) => _setSelectedEnergies(windows[i]),
              hideEnergies: _isAll,
            ),
          ],
        ),
      ),
    );
  }
}
