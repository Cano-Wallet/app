import 'package:example/core/utils/console.dart';
import 'package:example/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:bip39/bip39.dart' as bip39;

class ConfirmSeedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmSeedScreenController());
  }
}

class ConfirmSeedScreenController extends GetxController with ConsoleMixin {
  // VARIABLES
  final passphraseCard = const PassphraseCard(confirmMode: true);

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void verify() {
    final verificationSeed = passphraseCard.obtainSeed();

    // extra check
    if (!bip39.validateMnemonic(verificationSeed)) {
      return console.error('invalid verification seed');
    }

    final originalSeed = Get.parameters['seed'];

    // extra check
    if (!bip39.validateMnemonic(verificationSeed)) {
      return console.error('invalid original seed');
    }

    if (originalSeed != verificationSeed) {
      return console.error('seed does not match');
    }

    console.info('verified: $verificationSeed');
  }
}
