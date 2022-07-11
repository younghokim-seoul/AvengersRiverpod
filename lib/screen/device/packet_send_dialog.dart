import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ble/ble_interactor_provider.dart';

class PacketSendDialog extends ConsumerWidget {
  const PacketSendDialog({
    Key? key,
    required this.characteristic,
  }) : super(key: key);

  final QualifiedCharacteristic characteristic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interactor = ref.watch(interactorProvider);
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          ...sendSection,
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () async {
                    await interactor.writeCharacterisiticWithoutResponse(characteristic,[0x50,0x01,0x00,0x51]);
                  },
                  child: const Text('close!')),
            ),
          )
        ],
      ),
    ));
  }

  Widget _header(String text) => Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );

  List<Widget> get sendSection => [
        _header('Write Send Packet'),
      ];
}
