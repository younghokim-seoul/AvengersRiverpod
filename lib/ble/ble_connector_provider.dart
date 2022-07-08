import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/ble/ble_provider.dart';
import 'package:riverpod_sample/main.dart';

part 'ble_connector_provider.freezed.dart';

final connectorProvider = StateNotifierProvider.autoDispose<
    DeviceConnectorStateNotifier, ConnectorState>(
  (ref) {
    final bleModule = ref.watch(bleProvider);
    final stateNotifier = DeviceConnectorStateNotifier(ble: bleModule);
    return stateNotifier;
  },
);

class DeviceConnectorStateNotifier extends StateNotifier<ConnectorState> {
  DeviceConnectorStateNotifier({
    required this.ble,
  }) : super(ConnectorState(
          connectionStateUpdate: const ConnectionStateUpdate(
            deviceId: "",
            connectionState: DeviceConnectionState.disconnected,
            failure: null,
          ),
        ));

  late StreamSubscription<ConnectionStateUpdate> _connection;
  final FlutterReactiveBle ble;

  Future<void> connect(String deviceId) async {
    logger.i("::::connect try.. $deviceId");
    _connection = ble.connectToDevice(id: deviceId).listen(
      (update) {
        logger.i(
            'ConnectionState for device $deviceId : ${update.connectionState}');
        state = state.copyWith(connectionStateUpdate: update);
      },
      onError: (Object e) =>
          logger.i('Connecting to device $deviceId resulted in error $e'),
    );
  }

  Future<void> disconnect(String deviceId) async {
    try {
      logger.i('disconnecting to device: $deviceId');
      await _connection.cancel();
    } on Exception catch (e, _) {
      logger.i("Error disconnecting from a device: $e");
    } finally {
      state = state.copyWith(
        connectionStateUpdate: ConnectionStateUpdate(
          deviceId: deviceId,
          connectionState: DeviceConnectionState.disconnected,
          failure: null,
        ),
      );
    }
  }

  @override
  void dispose() async {
    logger.i("dispose");
    if(state.connectionStateUpdate.connectionState == DeviceConnectionState.connected){
      logger.i("connect dispose >>> after cancel");
      await _connection.cancel();
    }
    super.dispose();
  }
}

@freezed
class ConnectorState with _$ConnectorState {
  factory ConnectorState({
    required ConnectionStateUpdate connectionStateUpdate,
  }) = _ConnectorState;
}
