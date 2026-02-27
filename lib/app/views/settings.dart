import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/widgets/errors/alert_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isInitial = true;
  List<String>? _ssids;
  String? _activeSsid;
  String? _currentSsid;

  final _passwordController = TextEditingController();

  bool _muted = false;
  double? _mutedAt;
  double? _volume;
  DateTime _volumeLastApply = DateTime.now();

  DateTime? _subscriptionDate;

  @override
  void initState() {
    super.initState();

    context.read<AppStore>().transport.getVolume().then((result) {
      result.handle(
        onSuccess: (volume) {
          if (mounted) {
            if (volume == 0) {
              setState(() => _muted = true);
            } else {
              setState(() => _volume = volume);
            }
          }
        }
      );
    });

    context.read<AppStore>().transport.subscriptionStatus().then((result) {
      result.handle(
        onSuccess: (datetime) {
          if (mounted) {
            setState(() => _subscriptionDate = datetime);
          }
        }
      );
    });
  }

  void _updateWifiInfo() {
    context.read<AppStore>().getWifiNetworks().then((result) {
      if (mounted) {
        switch (result) {
          case Ok<(List<String>, int?)>():
            final originalSsids = result.value.$1;
            final activeIndex = result.value.$2;

            final uniqueSsids = <String>[];
            for (final ssid in originalSsids) {
              if (!uniqueSsids.contains(ssid) && ssid.isNotEmpty) {
                uniqueSsids.add(ssid);
              }
            }

            int? newActiveIndex;
            if (activeIndex != null && activeIndex >= 0 && activeIndex < originalSsids.length) {
              final activeSsid = originalSsids[activeIndex];
              newActiveIndex = uniqueSsids.indexOf(activeSsid);
            }

            setState(() {
              _ssids = uniqueSsids;
              _currentSsid = newActiveIndex != null ? uniqueSsids[newActiveIndex] : null;
              _activeSsid = _currentSsid;
            });
            break;
          case Err<(List<String>, int?)>():
            // TODO: handle error
            setState(() {
              _isInitial = true;
              _ssids = _currentSsid = _activeSsid = null;
            });
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;

    final volume = _volume ?? context.select<PlayerStore, double>((store) => store.volume ?? 1);
    
    return AppShell(
      navIcon: QJay.qs_logo,
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
            
          const SizedBox(height: 12),
        
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Volume",
                        style: themeData.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                      IconButton(
                        icon: Icon(_muted ? Icons.volume_off_outlined : Icons.volume_up_rounded),
                        onPressed: () {
                          setState(() => _muted = !_muted);
            
                          if (_muted) {
                            context.read<PlayerStore>().setVolume(0);
                            setState(() => _mutedAt = volume);
                          } else {
                            context.read<PlayerStore>().setVolume(_mutedAt ?? 1);
            
                            Future.delayed(Duration(milliseconds: 800)).then((_) {
                              if (mounted) {
                                setState(() => _mutedAt = null);
                              }
                            });
                          }
                        }
                      )
                    ]
                  ),
                  
                  const SizedBox(height: 12),
        
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                      trackHeight: 4,
                      trackShape: RoundedRectSliderTrackShape(),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
                    ),
                    child: Slider(
                      
                      divisions: 100,
                      value: (_muted ? _mutedAt : _mutedAt ?? _volume) ?? volume,
                      onChanged: _muted ? null : (value) {
                        setState(() {
                          _volume = value;
                          _mutedAt = null;
                        });
            
                        final now = DateTime.now();
                        if (now.difference(_volumeLastApply).inMilliseconds > 200) {
                          _volumeLastApply = now;
                          context.read<PlayerStore>().setVolume(value);
                        }
                      },
                      onChangeEnd: (value) {
                        context.read<PlayerStore>().setVolume(value);
                        Future.delayed(Duration(milliseconds: 800)).then((_) {
                          if (!mounted) return;
            
                          setState(() {
                            _volume = null;
                            _mutedAt = _muted ? _mutedAt : null;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        
          const SizedBox(height: 16),
        
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "W-Fi",
                        style: themeData.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                      IconButton(
                        icon: Icon(Icons.refresh_rounded),
                        onPressed: _ssids == null && !_isInitial ? null : () {
                          _updateWifiInfo();
                          _passwordController.clear();
                          setState(() {
                            _isInitial = false;
                            _ssids = _currentSsid = _activeSsid = null;
                          });
                        }
                      )
                    ]
                  ),
            
                  const SizedBox(height: 12),
            
                  if (_ssids == null)
                    SizedBox(
                      height: 132,
                      child: Center(
                        child: _isInitial
                        ? Text("Refresh to get status", style: themeData.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface))
                        : CircularProgressIndicator()
                      ),
                    ),
            
                  if (_ssids != null) ...[
                      Text(
                        _activeSsid == null ? "Disconnected" : "Connected ($_activeSsid)",
                        style: themeData.textTheme.titleMedium?.copyWith(
                          color: _activeSsid == null ? colorScheme.onSurface.withValues(alpha: 0.6) : colorScheme.primary,
                          wordSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 4),
            
                      DropdownButton<String>(
                        isExpanded: true,
                        value: _ssids?.isNotEmpty ?? false ? _currentSsid : "No networks found",
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        dropdownColor: colorScheme.surfaceContainerHigh,
                        style: themeData.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                        onChanged: (String? value) {
                          setState(() => _currentSsid = value);
                        },
                        items: (_ssids?.isNotEmpty ?? false ? _ssids! : ["No networks found"])
                          .map<DropdownMenuItem<String>>((String value)
                            => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
                      ),
            
                      const SizedBox(height: 8),
            
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              enabled: (_ssids?.isNotEmpty ?? false) && _activeSsid != _currentSsid,
                              obscureText: true,
                              style: themeData.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onPrimary
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Password",
                                border: const OutlineInputBorder(),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                hintStyle: themeData.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            onPressed: (_ssids?.isNotEmpty ?? false) && _activeSsid != _currentSsid ? () {
                              if (_currentSsid == null || _passwordController.text.isEmpty) return;
            
                              context.read<AppStore>().connectToSsid(_currentSsid!, _passwordController.text).then((_) {
                                if (mounted) {
                                  _updateWifiInfo();
                                }
                              });
            
                              _passwordController.clear();
                              setState(() => _ssids = _currentSsid = _activeSsid = null);
                            } : null,
                            child: const Text("Connect"),
                          ),
                        ],
                      ),
                    ]
                ],
              ),
            ),
          ),
            
          const SizedBox(height: 16),
            
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account",
                        style: themeData.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                  ),
                  
                  const SizedBox(height: 12),
        
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        if (_subscriptionDate == null)
                          Text(
                            "Checking...",
                            style: themeData.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                          ),
            
                        if (_subscriptionDate != null) ...[
                          Text(
                            _subscriptionDate!.isBefore(DateTime.now())
                              ? "Inactive"
                              : "Valid Until: ${_subscriptionDate!.year}-${_subscriptionDate!.month.toString().padLeft(2, '0')}-${_subscriptionDate!.day.toString().padLeft(2, '0')}",
                            style: themeData.textTheme.titleMedium?.copyWith(
                              color: _subscriptionDate!.isBefore(DateTime.now()) ? colorScheme.error : colorScheme.primary,
                            ),
                          ),
            
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: colorScheme.primaryContainer,
                              foregroundColor: colorScheme.onPrimaryContainer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              showAlertDialogWithInput(
                                context: context,
                                title: "Add Key",
                                message: "Please enter the key that was provided",
                                onSubmit: (key) {
                                  if (mounted) {
                                    context.read<AppStore>().trySubmitKey(context, key, onSuccess: () {
                                      if (!mounted) return;
                                      
                                      context.read<AppStore>().transport.subscriptionStatus().then((result) {
                                        result.handle(
                                          onSuccess: (datetime) {
                                            if (mounted) {
                                              setState(() => _subscriptionDate = datetime);
                                            }
                                          }
                                        );
                                      });
                                    });
                                  }
                                }
                              );
                            },
                            child: Text("Add Key", style: themeData.textTheme.titleMedium),
                          ),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      navigationIndex: 3,
    );
  }
}
