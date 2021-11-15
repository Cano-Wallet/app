import 'package:app/core/managers/zenon.manager.dart';
import 'package:app/core/utils/console.dart';
import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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

  void continuePressed() async {
    // TODO: improve validation
    if (passwordController.text != passwordConfirmController.text) {
      return console.error('Passwords do not match');
    }

    final keyStore = KeyStore.fromMnemonic(Get.parameters['mnemonic']!);
    // save keystore
    await Zenon()
        .keyStoreManager
        .saveKeyStore(keyStore, passwordController.text);
    // set as default KeyStore
    ZenonManager.setKeyStore(keyStore);
    // back to main screen
    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
