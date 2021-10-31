import 'package:example/core/utils/console.dart';
import 'package:example/features/app/routes.dart';
import 'package:example/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:bip39/bip39.dart' as bip39;

class CreateWalletPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateWalletPasswordScreenController());
  }
}

class CreateWalletPasswordScreenController extends GetxController
    with ConsoleMixin {
  // VARIABLES
  final passphraseCard = const PassphraseCard();

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void continuePressed() {
    final seed = passphraseCard.obtainSeed();

    // extra check
    if (!bip39.validateMnemonic(seed)) {
      return console.error('invalid seed');
    }

    console.info('seed: $seed');

    Get.toNamed(Routes.confirmSeed, parameters: {'seed': seed});
  }
}
