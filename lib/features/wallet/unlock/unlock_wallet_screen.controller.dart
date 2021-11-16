import 'package:cano/core/managers/zenon.manager.dart';
import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/ui_utils.dart';
import 'package:cano/features/app/routes.dart';
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
        message: '<num> attempts left', // TODO: work on max attempts
        icon: const Icon(LineIcons.exclamationTriangle, color: Colors.red),
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
