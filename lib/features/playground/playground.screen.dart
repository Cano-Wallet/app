import 'package:example/core/utils/console.dart';
import 'package:example/features/playground/playground_screen.controller.dart';
import 'package:example/features/welcome/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlaygroundScreen extends GetView<PlaygroundScreenController>
    with ConsoleMixin {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(
                child: const Text('Test'),
                onPressed: () {
                  Get.to(() => const WelcomeScreen());
                },
              ),
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
              const Text(
                'Web Socket API',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              TextField(
                controller: controller.rpcUrlController,
                decoration: const InputDecoration(
                  labelText: 'JSON-RPC URL',
                ),
              ),
              TextField(
                controller: controller.methodController,
                decoration: const InputDecoration(
                  labelText: 'Method',
                ),
              ),
              TextField(
                controller: controller.parametersController,
                decoration: const InputDecoration(
                  labelText: 'Parameters',
                  hintText:
                      'Supports multiple types in array: String, int, double',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: controller.wsRequest,
                icon: const Icon(Icons.send),
                label: const Text('Send WS Request'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: controller.httpRequest,
                icon: const Icon(Icons.send),
                label: const Text('Send HTTP Request'),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Response',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Obx(() => Text(controller.apiResult())),
              ),
              const SizedBox(height: 20),
              const Text(
                'Others',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: controller.info,
                    child: const Text('Print Info'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: controller.nativeRequest,
                    child: const Text('Native Request'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
