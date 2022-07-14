import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/ble/ble_provider.dart';
import 'package:riverpod_sample/main.dart';

part 'ble_scan_provider.freezed.dart';

final scanResultProvider = StateNotifierProvider.autoDispose<ScanResultStateNotifier, BleScannerState>(
  (ref) {
    final bleModule = ref.watch(bleProvider);
    final stateNotifier = ScanResultStateNotifier(ble: bleModule);
    ref.onDispose(() {
      logger.e(":::::::::::::::::onDispose >>>>>>>>>>>>>>>>>>>");
      stateNotifier.stop();
    });
    return stateNotifier;
  },
);

class ScanResultStateNotifier extends StateNotifier<BleScannerState> {
  ScanResultStateNotifier({
    required this.ble,
  }) : super(BleScannerState(discoveredDevices: []));

  final FlutterReactiveBle ble;
  final _devices = <DiscoveredDevice>[];
  StreamSubscription? _scanSubscription;
  Timer? _scanTimer;

  void scan() {
    state = state.copyWith(discoveredDevices: []);
    _scanSubscription?.cancel();
    _scanSubscription = ble.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency,requireLocationServicesEnabled: true).listen((device) {
      final knownDeviceIndex = _devices.indexWhere((d) => d.id == device.id);
      if (knownDeviceIndex >= 0) {
        _devices[knownDeviceIndex] = device;
      } else {
        _devices.add(device);
      }

      if (mounted) {
        state = state.copyWith(discoveredDevices: _devices);
      }
    }, onError: (e) {
      logger.e("::::::::::e $e");
    });
    _setTimeOut();
  }

  void _setTimeOut() =>
      _scanTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
        logger.i("::::스캔 종료");
        stop();
      });

  Future<void> stop() async {
    _scanTimer?.cancel();
    await _scanSubscription?.cancel().then((value) => _scanSubscription = null);

  }

  @override
  void dispose() async {
    await stop();
    super.dispose();
  }
}

@freezed
class BleScannerState with _$BleScannerState {
  factory BleScannerState({
    required List<DiscoveredDevice> discoveredDevices,
  }) = _BleScannerState;
}
