import 'package:flutter/material.dart';
import 'package:qjay/app/app.dart';

import 'package:qjay/models/common.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;
import 'package:qjay/transport/proto/error.pbenum.dart' show ErrorType, SetupErrorType;
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:qjay/transport/transport_stub.dart';
import 'package:qjay/widgets/errors/alert_dialog.dart';
import 'package:qjay/widgets/errors/snack_bar.dart';

enum OnboardingStep { clientSetup, loading, updateDatabase, error, done }

sealed class AppState {
  const AppState();
}

class SplashState extends AppState {
  const SplashState();
}

class ConnectState extends AppState {
  final bool withError;
  const ConnectState({ this.withError = false });
}

class SyncincState extends AppState {
  final double progress;
  const SyncincState(this.progress);
}

class OnboardingState extends AppState {
  final OnboardingStep state;
  final int step;
  const OnboardingState({required this.state, this.step = 0});
}

class NavigationState<T> extends AppState {
  List<Preset> presets;
  NavigationState(this.presets);
}

class AppStore with ChangeNotifier {
  Transport _transport;
  Transport get transport => _transport;

  UpdaterEvent? _updaterEvent;
  UpdaterEvent? get updaterEvent => _updaterEvent;

  void _onTransportEvent(TransportEvent event) {
    switch (event) {
      case TransportEventError():
        showError(event.error);
        break;
      default:
        break;
    }
  }

  void _onConnectionEvent(ConnectionEvent event) {
    switch (event) {
      case ConnectionDisabledEvent():
      case ConnectionDisconnectedEvent():
        _state = ConnectState();
        notifyListeners();
        break;
      default:
        break;
    }
  }

  void _onUpdaterEvent(UpdaterEvent event) {
    _updaterEvent = event;
    notifyListeners();

    switch (event) {
      case SetupComplete():
        reloadApp();
      default:
        break;
    }
  }

  void switchToMockMode() {
    _reloadTransport(TransportStub());
    reloadApp();
    notifyListeners();
  }

  void stubOnboarding() {
    _reloadTransport(TransportStub(state: StubState.oboarding));
    reloadApp();
    notifyListeners();
  }

  void stubConnect() {
    _reloadTransport(TransportStub(state: StubState.connect));
    reloadApp();
    notifyListeners();
  }

  void stubHome() {
    _reloadTransport(TransportStub(state: StubState.home));
    reloadApp();
    notifyListeners();
  }

  int? _userId;
  int? get userId => _userId;

  String? _userName;
  String? get userName => _userName;

  AppState _state;
  AppState get state => _state;

  AppStore(this._transport) : _state = SplashState() {
    _transport.eventStream.listen(_onTransportEvent);
    _transport.connectionStream.listen(_onConnectionEvent);
    _transport.updaterStream.listen(_onUpdaterEvent);
    reloadApp();
  }

  void reloadApp() {
    _transport.bootstrap().then((result) {
      switch (result) {
        case Ok<()>():
          _transport.getPresetCount().then((result) async {
            result.handle(
              onSuccess: (presetCount) async {
                const batchSize = 4;
                final List<Preset> appPresets = [];

                for (int i = 0; i < presetCount; i += batchSize) {
                  final count = (i + batchSize <= presetCount) ? batchSize : (presetCount - i);
                  final presetsResult = await _transport.getPresets(i, count);

                  presetsResult.handle(
                    onSuccess: (value) {
                      appPresets.addAll(value.presets);

                      _state = SyncincState(appPresets.length.toDouble() / presetCount.toDouble());
                    },
                    onError: (error) {
                      _state = ConnectState(withError: true);
                    }
                  );
                  
                  notifyListeners();
                }

                _state = NavigationState(appPresets);
                notifyListeners();
              },
              onError: (error) {
                _state = ConnectState(withError: true);
                notifyListeners();
              },
            );
          });
          break;
        case Err<()>():

          if (result.error.hasGeneric()) {
            _state = ConnectState(withError: true);
            notifyListeners();
            return;
          }

          if (result.error.hasSetup()) {
            switch (result.error.setup.code) {
              case SetupErrorType.DATA_SETUP:
                _state = OnboardingState(state: OnboardingStep.updateDatabase);
                break;
              case SetupErrorType.USER_SETUP:
                _state = OnboardingState(state: OnboardingStep.clientSetup);
                _transport.setupWithUpdate();
                break;
            }

            notifyListeners();
          }
      }
    });
  }

  void reconnect([bool dispose = false]) {
    final context = MyApp.tempKey.currentContext;
    if (context == null || !context.mounted) return;
    clearDialogs(context);

    if (dispose) {
      _transport.dispose();
      _state = ConnectState(withError: true);
    } else {
      _transport.resumed();
    }
    
    notifyListeners();
  }

  void showError(pberror.Error error) {
    if (error.hasGeneric()) {
      final context = MyApp.tempKey.currentContext;
      if (context == null || !context.mounted) return;

      switch (error.generic.type) {
        case ErrorType.CONNECTION:
          reconnect(true);
          break;
        case ErrorType.WARNING:
          ScaffoldMessenger.of(context).showSnackBar(detaildSnackBar(context, error.generic.title, error.generic.message));
        case ErrorType.ERROR:
          showAlertDialogOk(
            context: context,
            title: error.generic.title,
            message: error.generic.message,
          );
        default:
          break;
      }    
    } else if (error.hasSubscriptionExpired()) {
      final context = MyApp.tempKey.currentContext;
      if (context == null || !context.mounted) return;

      if (error.subscriptionExpired.checked) {
        
        showAlertDialogWithInput(
          context: context,
          title: "Subscription Status",
          message: "Your subscription seems to have expired, contact support or enter the provided key",
          onSubmit: (key) => trySubmitKey(context, key),
        );

        return;
      }

      showAlertDialogBlocking(
        context: context,
        title: "Subscription Status",
        message: "Checking activation status...",
      );

      _transport.validateSubscriptionStatus().then((result) {
        if (!context.mounted) return;

        result.handle(
          onSuccess: (value) => showAlertDialogOk(
            context: context,
            title: "Subscription Status",
            message: "You are subscribed!\nPress play to resume playback",
          ),
          onError: (error) {
            if (error.hasSubscriptionExpired()) {
              showAlertDialogWithInput(
                context: context,
                title: "Subscription Status",
                message: "Your subscription seems to have expired, contact support or enter the provided key",
                onSubmit: (key) => trySubmitKey(context, key),
              );
            } else {
              showAlertDialogOk(context: context, title: "Unexpected Error", message: "An error occured, please try again");
            }
          }
        );
      });
    } else if (error.hasSecurity()) {
      final context = MyApp.tempKey.currentContext;
      if (context == null || !context.mounted) return;

      showAlertDialogOk(
        context: context,
        title: "Security Error",
        message: "Integrity check failed, please contact support",
      );
    } else if (error.hasSetup()) {

      switch (error.setup.code) {
        case SetupErrorType.DATA_SETUP:
          _state = OnboardingState(state: OnboardingStep.updateDatabase);
          break;
        case SetupErrorType.USER_SETUP:
          _state = OnboardingState(state: OnboardingStep.clientSetup);
          _transport.setupWithUpdate();
          break;
      }

      notifyListeners();
    }
  }

  void trySubmitKey(BuildContext context, String key, { Function()? onSuccess}) {
    _transport.addOfflineKey(key).then((result) {
      if (!context.mounted) return;

      result.handle(
        onSuccess: (value) {
          showAlertDialogOk(
            context: context,
            title: "Subscription Status",
            message: "You are subscribed!\nPress play to resume playback",
          );

          onSuccess?.call();
        },
        onError: (error) {
          showAlertDialogWithInput(
            context: context,
            title: "Subscription Status",
            message: "Provided key was invalid, please try again",
            initialValue: key,
            onSubmit: (key) => trySubmitKey(context, key, onSuccess: onSuccess),
          );
        },
      );
    });
  }

  void onboardingGoBack() {
    if (_state is OnboardingState) {
      _state = OnboardingState(state: OnboardingStep.clientSetup);
      notifyListeners();
    }
  }

  void setClientDetails({ String? userId, String? userName}) {
    _userId = userId == null ? _userId : int.tryParse(userId);
    _userName = userName ?? _userName;
    notifyListeners();
  }

  bool get userCanSubmit => _transport.isMock || (userId != null && userName?.isNotEmpty == true);

  void setupClient() {
    if (!userCanSubmit) return;

    final userId = _transport.isMock ? 47 : _userId;
    final userName = _transport.isMock ? "Mock" : _userName;
    if ((userId == null) || (userName == null)) return;
    
    _state = OnboardingState(state: OnboardingStep.loading);
    notifyListeners();

    _transport.setupClient(userId.toString(), userName).then((result) {

      result.handle(
        onSuccess: (value) {
          _state = OnboardingState(state: OnboardingStep.updateDatabase);
          _transport.setupWithUpdate();
        },
        onError: (error) {
          _state = OnboardingState(state: OnboardingStep.clientSetup);
        },
      );

      notifyListeners();
    });
  }

  void retryUpdate() {
    _state = OnboardingState(state: OnboardingStep.updateDatabase);
    _transport.setupWithUpdate();
    notifyListeners();
  }

  Future<Result<(List<String>, int?)>> getWifiNetworks() async {
    final result = await _transport.getWifiNetworkCount();

    return result.handleWithResponse(
      onSuccess: (networkCount) async {
        const chunkSize = 10;

        int activeIndex = -1;
        final ssids = <String>[];

        for (var offset = 0; offset < networkCount; offset += chunkSize) {

          final limit = (offset + chunkSize > networkCount) ? networkCount - offset : chunkSize;

          final ssidsResult = await _transport.getWifiNetworks(offset, limit);
          switch (ssidsResult) {
            case Ok<(List<String>, int)>():
              if (ssidsResult.value.$1.isNotEmpty) {
                activeIndex = ssidsResult.value.$2;
                ssids.addAll(ssidsResult.value.$1);
              }
              break;
            case Err<(List<String>, int)>():
              return Err(ssidsResult.error);
          }
        }

        return Ok((ssids, activeIndex == -1 ? null : activeIndex));
      },
      onError: (error) => Err(error),
    );
  }

  Future<Result<()>> connectToSsid(String ssid, String password) => _transport.connectToSsid(ssid, password);

  void _reloadTransport(Transport transport) {
    _transport.dispose();

    _transport = transport;
    _transport.eventStream.listen(_onTransportEvent);
    _transport.connectionStream.listen(_onConnectionEvent);
    _transport.updaterStream.listen(_onUpdaterEvent);
  }
}