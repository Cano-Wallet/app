import 'package:example/core/utils/console.dart';
import 'package:example/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'import_wallet_screen.controller.dart';

class ImportWalletScreen extends GetView<ImportWalletScreenController>
    with ConsoleMixin {
  const ImportWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const passphraseCard = PassphraseCard();

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
              passphraseCard,
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // final seed = passphraseCard.obtainSeed();
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
