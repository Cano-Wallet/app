import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'unlock_wallet_screen.controller.dart';

class UnlockWalletScreen extends GetView<UnlockWalletScreenController>
    with ConsoleMixin {
  const UnlockWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            constraints: Styles.containerConstraints,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LineIcons.lock, size: 100),
                const SizedBox(height: 20),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Enter the password to access the wallet',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: controller.passwordController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onChanged: controller.onChanged,
                  onSubmitted: (text) => controller.unlock(),
                  decoration: Styles.inputDecoration.copyWith(
                    hintText: 'Current Password',
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextButton.icon(
                    label: const Text('Unlock Wallet'),
                    icon: const Icon(LineIcons.lockOpen),
                    onPressed:
                        controller.canProceed() ? controller.unlock : null,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Text(
                    '${controller.attemptsLeft()} attempts left',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
