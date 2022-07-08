import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/ble/ble_provider.dart';
import 'package:riverpod_sample/main.dart';
import 'package:rxdart/rxdart.dart';

final interactorProvider = Provider.autoDispose<DeviceInteractorManager>((ref) {
  final bleModule = ref.watch(bleProvider);
  final bleLogger = ref.watch(bleLoggerProvider);
  return DeviceInteractorManager(
      bleDiscoverServices: bleModule.discoverServices,
      readCharacteristic: bleModule.readCharacteristic,
      writeWithResponse: bleModule.writeCharacteristicWithResponse,
      subscribeToCharacteristic: bleModule.subscribeToCharacteristic,
      logMessage: bleLogger.addToLog);
});

class DeviceInteractorManager {
  DeviceInteractorManager({
    required Future<List<DiscoveredService>> Function(String deviceId)
        bleDiscoverServices,
    required Future<List<int>> Function(QualifiedCharacteristic characteristic)
        readCharacteristic,
    required Future<void> Function(QualifiedCharacteristic characteristic,
            {required List<int> value})
        writeWithResponse,
    required Stream<List<int>> Function(QualifiedCharacteristic characteristic)
        subscribeToCharacteristic,
    required void Function(String message) logMessage,
  })  : _bleDiscoverServices = bleDiscoverServices,
        _readCharacteristic = readCharacteristic,
        _writeWithResponse = writeWithResponse,
        _subScribeToCharacteristic = subscribeToCharacteristic,
        _logMessage = logMessage;

  final Future<List<DiscoveredService>> Function(String deviceId)
      _bleDiscoverServices;

  final Future<List<int>> Function(QualifiedCharacteristic characteristic)
      _readCharacteristic;

  final Future<void> Function(QualifiedCharacteristic characteristic,
      {required List<int> value}) _writeWithResponse;

  final Stream<List<int>> Function(QualifiedCharacteristic characteristic)
      _subScribeToCharacteristic;

  final void Function(String message) _logMessage;

  Future<List<DiscoveredService>> discoverServices(String deviceId) async {
    try {
      _logMessage('Start discovering services for: $deviceId');
      final result = await _bleDiscoverServices(deviceId);
      _logMessage('Discovering services finished');
      return result;
    } on Exception catch (e) {
      _logMessage('Error occured when discovering services: $e');
      rethrow;
    }
  }

  Stream<List<int>> subScribeToCharacteristic(
      QualifiedCharacteristic characteristic) {
    _logMessage('Subscribing to: ${characteristic.characteristicId} ');
    return _subScribeToCharacteristic(characteristic);
  }
}
