import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/wallet/import/unlock_vault/unlock_vault_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class UnlockVaultScreen extends GetView<UnlockVaultScreenController>
    with ConsoleMixin {
  const UnlockVaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unlock Seed Vault'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            constraints: kMaxContainerConstraints,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LineIcons.lock, size: 100),
                const SizedBox(height: 20),
                const Text(
                  'Unlock your Seed Vault',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Input the Seed Vault Key to continue',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 15),
                Text(
                  'File: ${controller.keyStoreFileName}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: controller.passwordController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onChanged: controller.onChanged,
                  onSubmitted: (text) => controller.unlock(),
                  decoration: Styles.inputDecoration.copyWith(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextButton.icon(
                    label: const Text('Unlock Vault'),
                    icon: const Icon(LineIcons.lockOpen),
                    onPressed:
                        controller.canProceed() ? controller.unlock : null,
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
