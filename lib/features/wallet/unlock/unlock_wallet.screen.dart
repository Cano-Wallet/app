import 'package:app/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'unlock_wallet_screen.controller.dart';

class UnlockWalletScreen extends GetView<UnlockWalletScreenController>
    with ConsoleMixin {
  const UnlockWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Welcome back'),
              const Text('Enter the password to access the wallet'),
              const SizedBox(height: 30),
              TextField(
                controller: controller.passwordController,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
                decoration: const InputDecoration(hintText: 'Current password'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.unlock,
                child: const Text('Unlock'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
