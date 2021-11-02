import 'package:app/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_password_screen.controller.dart';

class CreateWalletPasswordScreen
    extends GetView<CreateWalletPasswordScreenController> with ConsoleMixin {
  const CreateWalletPasswordScreen({Key? key}) : super(key: key);

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
