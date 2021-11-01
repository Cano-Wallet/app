import 'package:example/core/utils/console.dart';
import 'package:example/core/zenon.manager.dart';
import 'package:example/features/app/routes.dart';
import 'package:example/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:example/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class ConfirmSeedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmSeedScreenController());
  }
}

class ConfirmSeedScreenController extends GetxController with ConsoleMixin {
  // VARIABLES
  final passphraseCard = const PassphraseCard(mode: PassphraseMode.confirm);

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void verify() {
    final verificationSeed = passphraseCard.obtainSeed();

    if (verificationSeed == null) {
      return console.info('invalid verification seed');
    }

    final originalSeed = Get.parameters['seed'];

    if (originalSeed == null) {
      return console.info('invalid original seed');
    }

    if (originalSeed != verificationSeed) {
      return console.error('seed does not match');
    }

    console.info('verified: $verificationSeed');

    // temporarily save keystore in a static class
    final keyStore = KeyStore.fromMnemonic(verificationSeed);

    ZenonManager.keyStore = keyStore;
    Zenon().defaultKeyStore = keyStore;
    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
