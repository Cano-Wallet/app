import 'package:example/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm_seed_screen.controller.dart';

class ConfirmSeedScreen extends GetView<ConfirmSeedScreenController>
    with ConsoleMixin {
  const ConfirmSeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Seed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Confirm your seed phrase'),
              const SizedBox(height: 10),
              controller.passphraseCard,
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.verify,
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
