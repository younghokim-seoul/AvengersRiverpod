import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ble/ble_logger.dart';

final bleProvider = Provider<FlutterReactiveBle>((ref) {
  return FlutterReactiveBle();
});


final bleLoggerProvider = Provider<BleLogger>((ref) {
  return BleLogger();
});