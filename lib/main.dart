import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_sample/app.dart';

var logger = Logger(
  printer: PrettyPrinter(methodCount: 1),
);

void main() {
  runApp(const ProviderScope(child: App()));
}
