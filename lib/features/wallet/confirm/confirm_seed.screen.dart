import 'package:cano/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Confirm your Seed',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                controller.passphraseCard,
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: controller.verify,
                  label: const Text('Verify'),
                  icon: const Icon(LineIcons.check),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
