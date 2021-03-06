import 'package:cano/core/utils/console.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:get/get.dart';

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

  void verify() async {
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

    Get.toNamed(
      Routes.createPassword,
      parameters: {'mnemonic': verificationSeed},
    );
  }
}
