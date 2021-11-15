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
        title: const Text('Create Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This will be the password to unlock the wallet'),
              const SizedBox(height: 30),
              TextField(
                controller: controller.passwordController,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
                decoration: const InputDecoration(hintText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.passwordConfirmController,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
                decoration: const InputDecoration(hintText: 'Confirm Password'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Text(
                  'Use a password that has at least 8 characters, one uppercase letter, one lowercase letter, and one symbol'),
              ElevatedButton(
                onPressed: controller.continuePressed,
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
