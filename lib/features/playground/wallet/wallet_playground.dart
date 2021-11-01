import 'package:example/features/playground/wallet/wallet_playground.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WalletPlayground extends StatelessWidget {
  const WalletPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletPlaygroundController());

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wallet',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Obx(
              () => DropdownButton<String>(
                value: controller.accountIndex.toString(),
                onChanged: controller.accountChanged,
                items: controller.accountDropdownItems,
              ),
            ),
            TextField(
              controller: controller.mnemonicController,
              minLines: 3,
              maxLines: 3,
              onChanged: (text) => controller.process(),
              decoration: const InputDecoration(
                labelText: 'Mnemonic Seed Phrase',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: controller.generate,
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text('Generate'),
                ),
                const SizedBox(width: 20),
                Obx(
                  () => DropdownButton<String>(
                    value: controller.seedStrength.toString(),
                    onChanged: controller.seedStrengthChanged,
                    items: controller.seedStrengthDropdownItems,
                  ),
                ),
              ],
            ),
            const Divider(),
            ListTile(
              title: const Text('Entropy'),
              subtitle: Obx(() => Text(controller.entropy())),
            ),
            ListTile(
              title: const Text('Seed'),
              subtitle: Obx(() => Text(controller.seed())),
            ),
            ListTile(
              title: const Text('Private Key'),
              subtitle: Obx(() => Text(controller.privateKeyHex())),
            ),
            ListTile(
              title: const Text('Public Key'),
              subtitle: Obx(() => Text(controller.publicKeyHex())),
            ),
            ListTile(
              title: const Text('Address HRP'),
              subtitle: Obx(() => Text(controller.addressHrp())),
            ),
            ListTile(
              title: const Text('Address Short'),
              subtitle: Obx(() => Text(controller.addressShort())),
            ),
            ListTile(
              title: const Text('Address Long'),
              subtitle: Obx(() => Text(controller.addressLong())),
              onTap: () => Clipboard.setData(
                ClipboardData(text: controller.addressLong()),
              ),
            ),
            ListTile(
              title: const Text('Address Core Bytes'),
              subtitle: Obx(() => Text(controller.addressCoreBytes())),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: controller.info,
              child: const Text('KeyStore Info'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: controller.createKeyStore,
              child: const Text('Create KeyStore File'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: controller.open,
              child: const Text('Read KeyStore'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: controller.importKeyStoreFile,
              child: const Text('Import KeyStore File'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: controller.send,
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
