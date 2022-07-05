import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bleProvider = Provider<FlutterReactiveBle>((ref) {
  return FlutterReactiveBle();
});
