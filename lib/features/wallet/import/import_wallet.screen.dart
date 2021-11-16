import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
          child: Container(
            constraints: Styles.containerConstraints,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Import your Seed',
                  style: TextStyle(fontSize: 20),
                ),
                controller.passphraseCard,
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: controller.importSeed,
                  label: const Text('Continue'),
                  icon: const Icon(LineIcons.arrowRight),
                ),
                const Divider(height: 20),
                TextButton.icon(
                  onPressed: controller.importKeyStoreFile,
                  label: const Text('Import Keystore File'),
                  icon: const Icon(LineIcons.download),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
