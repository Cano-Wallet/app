import 'package:example/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'import_wallet_screen.controller.dart';

class ImportWalletScreen extends GetView<ImportWalletScreenController>
    with ConsoleMixin {
  const ImportWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Import using your seed phrase'),
              const SizedBox(height: 10),
              controller.passphraseCard,
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.importSeed,
                child: const Text('Continue'),
              ),
              const Divider(),
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'KeyStore Password',
                ),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (text) => controller.validateSeed(text!), // TODO: validate a strong password
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.importKeyStoreFile,
                child: const Text('Import KeyStore File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
