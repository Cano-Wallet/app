import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/ui_utils.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
  final chkBackedUpSeed = false.obs;
  final chkWrittenSeed = false.obs;

  // GETTERS
  bool get canProceed => chkBackedUpSeed() && chkWrittenSeed();

  // INIT

  // FUNCTIONS

  void continuePressed() {
    final seed = passphraseCard.obtainSeed();

    if (seed == null) {
      UIUtils.showSnackBar(
        title: 'Invalid Seed',
        message: 'Please make sure your seed is valid',
        icon: const Icon(LineIcons.exclamationTriangle, color: Colors.red),
        seconds: 4,
      );

      return console.info('invalid seed');
    }

    console.info('seed: $seed');

    Get.toNamed(Routes.confirmSeed, parameters: {'seed': seed});
  }

  void export() async {
    //
  }
}
