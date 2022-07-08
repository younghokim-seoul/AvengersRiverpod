import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ble/ble_connector_provider.dart';
import 'package:riverpod_sample/main.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  static const routeName = '/deviceDetail';

  final DiscoveredDevice device;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final connector = ref.watch(connectorProvider);

    var deviceConnected = connector.connectionStateUpdate.connectionState == DeviceConnectionState.connected;


    //
    //
    //
    // ref.listen<ConnectorState>(connectorProvider, (previous, next) {
    //   logger.i(":::::next " + next.connectionStateUpdate.toString());
    //   switch (next.connectionStateUpdate.connectionState) {
    //     case DeviceConnectionState.connected:
    //       break;
    //     case DeviceConnectionState.disconnected:
    //       break;
    //     default:
    //       break;
    //   }
    // });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(device.name.isNotEmpty ? device.name : device.id),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                logger.i("::deviceConnected ..." + deviceConnected.toString());
                  if(deviceConnected){
                    ref.watch(connectorProvider.notifier).disconnect(device.id);
                  }else{
                    ref.watch(connectorProvider.notifier).connect(device.id);
                  }
              },
              child: Text(deviceConnected ? "disconnect" : "connect",style: const TextStyle(color: Colors.white),),
            ),
          ],
        ),
      )),
    );
  }


}

class _DeviceControll extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}
