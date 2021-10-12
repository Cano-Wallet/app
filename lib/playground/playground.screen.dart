import 'package:example/playground/playground_screen.controller.dart';
import 'package:example/utils/my_loggy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaygroundScreen extends StatelessWidget with MyLoggy {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlaygroundScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zenon Playground",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      value: controller.mnemonicStrength.toString(),
                      onChanged: controller.mnemonicStrengthChanged,
                      items: controller.mnemonicStrengthDropdownItems,
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
              ),
              ListTile(
                title: const Text('Address Core Bytes'),
                subtitle: Obx(() => Text(controller.addressCoreBytes())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
