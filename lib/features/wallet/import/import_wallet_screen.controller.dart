import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/ui_utils.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase.card.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
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
      UIUtils.showSnackBar(
        title: 'Invalid Seed',
        message: 'Please make sure your seed is valid',
        icon: const Icon(LineIcons.exclamationTriangle, color: Colors.red),
        seconds: 4,
      );

      return console.info('invalid seed');
    }

    console.info('seed: $seed');

    final keyStore = KeyStore.fromMnemonic(seed);

    Get.toNamed(
      Routes.createPassword,
      parameters: {'mnemonic': keyStore.mnemonic!},
    );
  }

  void importKeyStoreFile() async {
    final file = await Utils.pickKeyStoreFile();
    if (file == null) return;
    console.info('file: ${file.path}');

    Get.toNamed(
      Routes.unlockVault,
      parameters: {'file': file.path},
    );
  }
}
