import 'package:app/core/managers/zenon.manager.dart';
import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/ui_utils.dart';
import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class UnlockWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnlockWalletScreenController());
  }
}

class UnlockWalletScreenController extends GetxController with ConsoleMixin {
  // VARIABLES
  final passwordController = TextEditingController();

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void unlock() async {
    final zenon = Zenon();
    final keyStoreFiles = await ZenonManager.keyStoreFiles();

    KeyStore? keyStore;

    try {
      // TODO: check if has more than one keystore file saved and let choose
      keyStore = await zenon.keyStoreManager.readKeyStore(
        passwordController.text,
        keyStoreFiles.first,
      );
    } catch (e) {
      UIUtils.showSnackBar(
        title: 'Incorrect password',
        message: '3 attempts left', // TODO: work on max attempts
        icon: const Icon(LineIcons.info),
        seconds: 4,
      );

      return console.error(e.toString());
    }

    // set as default
    ZenonManager.setKeyStore(keyStore);

    // set viewing address
    viewingAddress = await ZenonManager.address;

    // back to main screen
    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
