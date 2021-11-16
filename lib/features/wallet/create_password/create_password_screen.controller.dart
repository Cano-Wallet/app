import 'package:cano/core/managers/zenon.manager.dart';
import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/ui_utils.dart';
import 'package:cano/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class CreateWalletPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateWalletPasswordScreenController());
  }
}

class CreateWalletPasswordScreenController extends GetxController
    with ConsoleMixin {
  // VARIABLES
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void confirm() async {
    // TODO: improve validation
    if (passwordController.text != passwordConfirmController.text) {
      UIUtils.showSnackBar(
        title: 'Passwords do not match',
        message: 'Re-enter your passwords',
        icon: const Icon(LineIcons.exclamationTriangle, color: Colors.red),
        seconds: 4,
      );

      return console.error('Passwords do not match');
    }

    final keyStore = KeyStore.fromMnemonic(Get.parameters['mnemonic']!);
    // save keystore
    await Zenon()
        .keyStoreManager
        .saveKeyStore(keyStore, passwordController.text);
    // set as default KeyStore
    ZenonManager.setKeyStore(keyStore);

    // set viewing address
    viewingAddress = await ZenonManager.address;

    // back to main screen
    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
