import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_sample/app.dart';
import 'package:riverpod_sample/ble/ble_logger.dart';

var logger = Logger(
  printer: PrettyPrinter(methodCount: 1),
);

void main() {
  runApp(ProviderScope(child: App()));
}
