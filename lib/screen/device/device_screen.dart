import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_sample/ble/ble_connector_provider.dart';
import 'package:riverpod_sample/ble/ble_interactor_provider.dart';
import 'package:riverpod_sample/main.dart';
import 'package:riverpod_sample/screen/device/packet_send_dialog.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  static const routeName = '/deviceDetail';

  final DiscoveredDevice device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connector = ref.watch(connectorProvider);
    final interactor = ref.watch(interactorProvider);

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
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) {
                          return PacketSendDialog(characteristic: QualifiedCharacteristic(
                              characteristicId: Uuid.parse("0783b03e-8535-b5a0-7140-a304d2495cca"),
                              serviceId: Uuid.parse("0783b03e-8535-b5a0-7140-a304d2495cc7"),
                              deviceId: device.id));
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
                    onPressed: () {},
                    child: const Text(
                      "read",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Gap(10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {},
                    child: const Text(
                      "notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            const Gap(10),
            // if (deviceConnected)
            //   CircularProgressIndicator(
            //     strokeWidth: 2,
            //   ),
          ],
        ),
      )),
    );
  }
}

class _DeviceControll extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
