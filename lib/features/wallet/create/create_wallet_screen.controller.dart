import 'package:app/core/utils/console.dart';
import 'package:app/features/app/routes.dart';
import 'package:app/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:app/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreateWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateWalletScreenController());
  }
}

class CreateWalletScreenController extends GetxController with ConsoleMixin {
  // VARIABLES
  final passphraseCard = const PassphraseCard(mode: PassphraseMode.create);

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void continuePressed() {
    final seed = passphraseCard.obtainSeed();

    if (seed == null) {
      return console.info('invalid seed');
    }

    console.info('seed: $seed');

    Get.toNamed(Routes.confirmSeed, parameters: {'seed': seed});
  }
}
