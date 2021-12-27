import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/welcome/welcome_screen.controller.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> with ConsoleMixin {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Obx(
                () => Text(
                  'v${controller.appVersion}',
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ),
            Center(
              child: Container(
                constraints: Styles.containerConstraints,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Images.logo, width: 100),
                    const SizedBox(height: 20),
                    const Text(
                      'Cano',
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      kAppDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 50),
                    TextButton.icon(
                      label: const Text('Create Wallet'),
                      icon: const Icon(LineIcons.plus),
                      onPressed: () => Get.toNamed(Routes.createWallet),
                    ),
                    const SizedBox(height: 15),
                    TextButton.icon(
                      label: const Text('Import Wallet'),
                      icon: const Icon(LineIcons.download),
                      onPressed: () => Get.toNamed(Routes.importWallet),
                    ),
                    const SizedBox(height: 15),
                    TextButton.icon(
                      label: const Text('Hardware Wallet'),
                      icon: const Icon(LineIcons.usb),
                      onPressed: null,
                    ),
                    const SizedBox(height: 15),
                    TextButton.icon(
                      label: const Text('View Mode'),
                      icon: const Icon(LineIcons.eyeAlt),
                      onPressed: () => Get.toNamed(Routes.viewingAddress),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
