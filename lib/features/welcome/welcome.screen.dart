import 'package:app/core/utils/console.dart';
import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget with ConsoleMixin {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome'),
            const SizedBox(height: 20),
            const Text('Select an option to access your wallet'),
            const Divider(),
            ElevatedButton(
              child: const Text('Create'),
              onPressed: GetPlatform.isDesktop
                  ? () => Get.toNamed(Routes.createWallet)
                  : null,
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Import'),
              onPressed: GetPlatform.isDesktop
                  ? () => Get.toNamed(Routes.importWallet)
                  : null,
            ),
            const Divider(),
            const ElevatedButton(
              child: Text('Hardware'),
              onPressed: null,
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Viewing Mode'),
              onPressed: GetPlatform.isMobile
                  ? () => Get.toNamed(Routes.viewingAddress)
                  : null,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
