import 'package:cano/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bip39/bip39.dart' as bip39;

enum PassphraseMode {
  create,
  confirm,
  import,
}

class PassphraseCardController extends GetxController with ConsoleMixin {
  // VARIABLES
  final seedController = TextEditingController();

  String seed24 = '', seed12 = '';

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void init({final mode = PassphraseMode.create}) {
    if (mode == PassphraseMode.create) {
      // generate seed
      generateSeed();
      // show generated seed
      strengthIndexChanged(0);
    } else if (mode == PassphraseMode.confirm) {
      //
    } else if (mode == PassphraseMode.import) {
      //
    }
  }

  void strengthIndexChanged(int index) {
    if (index == 0) {
      seedController.text = seed24;
    } else {
      seedController.text = seed12;
    }
  }

  void generateSeed() {
    seed24 = bip39.generateMnemonic(strength: 256);
    seed12 = bip39.generateMnemonic(strength: 128);
  }

  String? validateSeed(String seedPhrase) {
    if (seedPhrase.isEmpty || !bip39.validateMnemonic(seedPhrase)) {
      return 'Invalid seed phrase';
    } else {
      return null;
    }
  }
}
