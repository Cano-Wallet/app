import 'package:cano/core/utils/console.dart';
import 'package:cano/features/wallet/create/create_wallet_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateWalletScreen extends GetView<CreateWalletScreenController>
    with ConsoleMixin {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.passphraseCard,
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.continuePressed,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
