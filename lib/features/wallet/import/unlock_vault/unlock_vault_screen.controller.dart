import 'dart:io';

import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/ui_utils.dart';
import 'package:cano/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:path/path.dart';

class UnlockVaultScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnlockVaultScreenController());
  }
}

class UnlockVaultScreenController extends GetxController with ConsoleMixin {
  // VARIABLES
  final passwordController = TextEditingController();
  final keyStoreFileName = basename(Get.parameters['file']!);

  // PROPERTIES
  final canProceed = false.obs;

  // GETTERS

  // INIT

  // FUNCTIONS

  void onChanged(String text) => canProceed.value = text.isNotEmpty;

  void unlock() async {
    final file = File(Get.parameters['file']!);

    KeyStore? keyStore;

    try {
      keyStore = await Zenon().keyStoreManager.readKeyStore(
            passwordController.text,
            file,
          );
    } catch (e) {
      passwordController.clear();
      canProceed.value = false;

      UIUtils.showSnackBar(
        title: 'Unlock Vault Error',
        message: 'Incorrect password',
        icon: const Icon(LineIcons.exclamationTriangle, color: Colors.red),
        seconds: 4,
      );

      return console.error(e.toString());
    }

    Get.toNamed(
      Routes.createPassword,
      parameters: {'mnemonic': keyStore.mnemonic!},
    );
  }
}
