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
      writeWithOutResponse: bleModule.writeCharacteristicWithoutResponse,
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
    required Future<void> Function(QualifiedCharacteristic characteristic,
        {required List<int> value})
    writeWithOutResponse,
    required Stream<List<int>> Function(QualifiedCharacteristic characteristic)
        subscribeToCharacteristic,
    required void Function(String message) logMessage,
  })  : _bleDiscoverServices = bleDiscoverServices,
        _readCharacteristic = readCharacteristic,
        _writeWithResponse = writeWithResponse,
        _writeWithoutResponse = writeWithOutResponse,
        _subScribeToCharacteristic = subscribeToCharacteristic,
        _logMessage = logMessage;

  final Future<List<DiscoveredService>> Function(String deviceId)
      _bleDiscoverServices;

  final Future<List<int>> Function(QualifiedCharacteristic characteristic)
      _readCharacteristic;

  final Future<void> Function(QualifiedCharacteristic characteristic,
      {required List<int> value}) _writeWithResponse;

  final Future<void> Function(QualifiedCharacteristic characteristic,
      {required List<int> value}) _writeWithoutResponse;

  final Stream<List<int>> Function(QualifiedCharacteristic characteristic)
      _subScribeToCharacteristic;

  final void Function(String message) _logMessage;


  Future<void> writeCharacterisiticWithResponse(QualifiedCharacteristic characteristic, List<int> value) async {
    try {
      logger.i("Write with response vaslue : $value to ${characteristic.characteristicId}");
      _logMessage('Write with response value : $value to ${characteristic.characteristicId}');
      await _writeWithResponse(characteristic, value: value);
    } on Exception catch (e, s) {
      _logMessage('Error occured when writing ${characteristic.characteristicId} : $e',);
      // ignore: avoid_print
      logger.e(":::::e $e");
      logger.e(":::::S$s");
      rethrow;
    }
  }

  Future<void> writeCharacterisiticWithoutResponse(
      QualifiedCharacteristic characteristic, List<int> value) async {
    try {

      logger.i("Write without response vaslue : $value to ${characteristic.characteristicId}");
      await _writeWithoutResponse(characteristic, value: value);
      _logMessage('Write without response value: $value to ${characteristic.characteristicId}');
    } on Exception catch (e, s) {
      _logMessage(
        'Error occured when writing ${characteristic.characteristicId} : $e',
      );
      logger.e(":::::e $e");
      logger.e(":::::S$s");
      rethrow;
    }
  }

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
    logger.i('Subscribing to: ${characteristic.characteristicId} ');
    _logMessage('Subscribing to: ${characteristic.characteristicId} ');
    return _subScribeToCharacteristic(characteristic);
  }


}
