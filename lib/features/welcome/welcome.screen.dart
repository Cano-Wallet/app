import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/welcome/welcome_screen.controller.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:line_icons/line_icons.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> with ConsoleMixin {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
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
                kProjectDescription,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              // Obx(
              //   () => Text(
              //     controller.appVersion,
              //     style: const TextStyle(color: Colors.grey),
              //   ),
              // ),
              const SizedBox(height: 50),
              TextButton.icon(
                label: const Text('Create Wallet'),
                icon: const Icon(LineIcons.plus),
                onPressed: GetPlatform.isDesktop
                    ? () => Get.toNamed(Routes.createWallet)
                    : null,
              ),
              const SizedBox(height: 15),
              TextButton.icon(
                label: const Text('Import Wallet'),
                icon: const Icon(LineIcons.download),
                onPressed: GetPlatform.isDesktop
                    ? () => Get.toNamed(Routes.importWallet)
                    : null,
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
                onPressed: GetPlatform.isMobile
                    ? () => Get.toNamed(Routes.viewingAddress)
                    : null,
              ),
              // const SizedBox(height: 30),
              // Obx(
              //   () => Text(
              //     controller.appVersion,
              //     style: const TextStyle(color: Colors.grey),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
