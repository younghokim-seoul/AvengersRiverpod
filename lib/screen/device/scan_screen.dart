import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ble/ble_scan_provider.dart';

import '../../main.dart';

class ScanScreen extends ConsumerWidget {
  const ScanScreen({Key? key}) : super(key: key);
  static const routeName = '/deviceScan';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DeviceList();
  }
}

class _DeviceList extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeviceListState();
}

class _DeviceListState extends ConsumerState<_DeviceList> {
  @override
  Widget build(BuildContext context) {
    ref.listen<BleScannerState>(scanResultProvider, (previous, next) {
      logger.i("::::흠s... ${next.discoveredDevices.length}");
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: const SizedBox(
              height: 2,
            ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ref.read(scanResultProvider.notifier).scan();
  }


}
