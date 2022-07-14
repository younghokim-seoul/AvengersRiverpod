import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:riverpod_sample/ble/ble_connector_provider.dart';
import 'package:riverpod_sample/ble/ble_scan_provider.dart';
import 'package:riverpod_sample/route/app_route.dart';
import 'package:riverpod_sample/screen/widget/loading_indicator.dart';
import 'package:riverpod_sample/widget/ble_icon.dart';
import 'package:riverpod_sample/widget/cutom_toast.dart';
import 'package:rxdart/rxdart.dart';

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
  final BehaviorSubject<BleScannerState> _subjectBleState = BehaviorSubject.seeded(BleScannerState(discoveredDevices: []));

  @override
  Widget build(BuildContext context) {
    ref.listen<BleScannerState>(scanResultProvider, (previous, next) {
      _subjectBleState.sink.add(next);
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: _subjectBleState.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final item = snapshot.data as BleScannerState;
                  return ListView(
                    children: item.discoveredDevices
                        .map(
                          (device) => ListTile(
                            title: Text(device.name),
                            subtitle: Text("${device.id}\nRSSI: ${device.rssi}"),
                            leading: const BluetoothIcon(),
                            onTap: () async {
                              await ref.read(scanResultProvider.notifier).stop();
                              await context.router.push(DeviceRoute(device: device));
                            },
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const LoadingIndicator();
                }
              },
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

  @override
  void dispose() {
    super.dispose();
    _subjectBleState.close();
  }
}
