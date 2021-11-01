import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/core/zenon.manager.dart';
import 'package:example/features/app/routes.dart';
import 'package:example/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:example/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class ImportWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImportWalletScreenController());
  }
}

class ImportWalletScreenController extends GetxController with ConsoleMixin {
  // VARIABLES
  final zenon = Zenon();

  final passphraseCard = const PassphraseCard(mode: PassphraseMode.import);
  final passwordController = TextEditingController();

  // FUNCTIONS

  void importSeed() async {
    final seed = passphraseCard.obtainSeed();

    if (seed == null) {
      return console.info('invalid seed');
    }

    console.info('seed: $seed');

    final keyStore = KeyStore.fromMnemonic(seed);

    // temporarily save keystore in a static class
    ZenonManager.keyStore = keyStore;
    zenon.defaultKeyStore = keyStore;
    // TODO: save keystore file if suppported

    Get.offNamedUntil(Routes.main, (route) => false);
  }

  void importKeyStoreFile() async {
    final file = await Utils.pickKeyStoreFile();
    if (file == null) return;
    console.info('file: ${file.path}');

    KeyStore? keyStore;

    try {
      keyStore = await zenon.keyStoreManager.readKeyStore(
        passwordController.text,
        file,
      );
    } catch (e) {
      return console.error(e.toString());
    }

    console.info('keyStore: ${keyStore.mnemonic}');

    // temporarily save keystore in a static class
    ZenonManager.keyStore = keyStore;
    zenon.defaultKeyStore = keyStore;
    // TODO: save keystore file if suppported

    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
