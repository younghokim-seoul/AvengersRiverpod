import 'dart:async';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_sample/ble/ble_connector_provider.dart';
import 'package:riverpod_sample/ble/ble_interactor_provider.dart';
import 'package:riverpod_sample/main.dart';
import 'package:riverpod_sample/screen/device/packet_send_dialog.dart';
import 'package:rxdart/rxdart.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  static const routeName = '/deviceDetail';

  final DiscoveredDevice device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connector = ref.watch(connectorProvider);

    var deviceConnected = connector.connectionStateUpdate.connectionState ==
        DeviceConnectionState.connected;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(device.name.isNotEmpty ? device.name : device.id),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                logger.i("::deviceConnected ..." + deviceConnected.toString());
                if (deviceConnected) {
                  ref.watch(connectorProvider.notifier).disconnect(device.id);
                } else {
                  ref.watch(connectorProvider.notifier).connect(device.id);
                }
              },
              child: Text(
                // deviceConnected ? "disconnect" : "connect",
                connector.connectionStateUpdate.connectionState.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (deviceConnected)
              Expanded(child: _DeviceControl(device: device)),
          ],
        ),
      )),
    );
  }
}

class _DeviceControl extends ConsumerStatefulWidget {
  const _DeviceControl({
    required this.device,
    Key? key,
  }) : super(key: key);

  final DiscoveredDevice device;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeviceControlState();
}

class _DeviceControlState extends ConsumerState<_DeviceControl> {
  StreamSubscription<List<int>>? subscribeStream;
  PublishSubject<String> responseDataStream = PublishSubject();

  @override
  Widget build(BuildContext context) {
    bool notifyEnable = ref.watch(notifyEnableProvider);
    List<String> items = [];
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return PacketSendDialog(
                          characteristic: QualifiedCharacteristic(
                              characteristicId: Uuid.parse(
                                  "0783b03e-8535-b5a0-7140-a304d2495cca"),
                              serviceId: Uuid.parse(
                                  "0783b03e-8535-b5a0-7140-a304d2495cc7"),
                              deviceId: widget.device.id));
                    },
                  );
                },
                child: const Text(
                  "write",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Gap(10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: subscribeCharacteristic,
                child: Text(
                  !notifyEnable ? "notify Enable" : "notify Disable",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
              child: StreamBuilder(
            stream: responseDataStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                var packet = snapshot.data as String;
                items.add(packet);
                return ListView(
                  children: [
                    ...items
                        .map((e) => _characteristicTile(e))
                        .toList()
                        .reversed
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          )),
        ]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    responseDataStream.close();
    subscribeStream?.cancel();
    super.dispose();
  }

  Future<void> subscribeCharacteristic() async {
    var characteristic = QualifiedCharacteristic(
        characteristicId: Uuid.parse("0783b03e-8535-b5a0-7140-a304d2495cc8"),
        serviceId: Uuid.parse("0783b03e-8535-b5a0-7140-a304d2495cc7"),
        deviceId: widget.device.id);

    if (subscribeStream == null) {
      subscribeStream = ref
          .read(interactorProvider)
          .subScribeToCharacteristic(characteristic)
          .listen((event) {
        logger.i('HEX: 0x${hex.encode(event)} DEC: $event');
        responseDataStream.sink.add(hex.encode(event));
      });
      ref.read(notifyEnableProvider.state).state = true;
    } else {
      // responseDataStream.sink.add("");
      await subscribeStream?.cancel();
      subscribeStream = null;
      ref.read(notifyEnableProvider.state).state = false;
    }
  }

  Widget _characteristicTile(String data) => ListTile(
        title: Text(
          data,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      );
}

final notifyEnableProvider = StateProvider<bool>((ref) => false);
