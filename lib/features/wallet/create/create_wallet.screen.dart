import 'package:cano/core/utils/console.dart';
import 'package:cano/features/wallet/create/create_wallet_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class CreateWalletScreen extends GetView<CreateWalletScreenController>
    with ConsoleMixin {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Wallet'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'This is your seed',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                controller.passphraseCard,
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: controller.export,
                  label: const Text('Export Seed'),
                  icon: const Icon(LineIcons.upload),
                ),
                const SizedBox(height: 20),
                ObxValue(
                  (RxBool data) => CheckboxListTile(
                    title: const Text(
                        "I have backed up my seed in a safe location"), //    <-- label
                    value: data.value,
                    onChanged: data,
                  ),
                  controller.chkBackedUpSeed,
                ),
                ObxValue(
                  (RxBool data) => CheckboxListTile(
                    title: const Text(
                        "I have written down my seed"), //    <-- label
                    value: data.value,
                    onChanged: data,
                  ),
                  controller.chkWrittenSeed,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextButton.icon(
                    onPressed: controller.canProceed
                        ? controller.continuePressed
                        : null,
                    label: const Text('Continue'),
                    icon: const Icon(LineIcons.arrowRight),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
