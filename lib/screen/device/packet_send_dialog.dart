import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ble/ble_interactor_provider.dart';
import 'package:riverpod_sample/main.dart';
import 'package:riverpod_sample/screen/device/packetControllerProvider.dart';

class PacketSendDialog extends ConsumerWidget {
  const PacketSendDialog({
    Key? key,
    required this.characteristic,
  }) : super(key: key);

  final QualifiedCharacteristic characteristic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interactor = ref.watch(interactorProvider);
    final textEditController = ref.watch(packetSendDialogProvider);

    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          ..._sendSection(textEditController),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () async {

                    final text = textEditController.text;
                    var len = text.toString().length;
                    var packetArray = <int>[];
                    var i = 0;
                    while (i < len) {
                      final hex = text.toString().substring(i, i + 2);
                      final number = int.parse(hex, radix: 16);
                      packetArray.add(number);
                      i += 2;
                    }
                    logger.i('HEX: 0x${hex.encode(packetArray)} DEC: $packetArray');
                    await interactor.writeCharacterisiticWithoutResponse(characteristic, packetArray);
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

  List<Widget> _sendSection(TextEditingController textEditController) => [
        _header('Write Send Packet'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            controller: textEditController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Value',
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
        ),
      ];
}
