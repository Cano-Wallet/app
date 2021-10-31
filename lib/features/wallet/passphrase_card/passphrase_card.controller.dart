import 'package:example/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:bip39/bip39.dart' as bip39;

class PassphraseCardController extends GetxController with ConsoleMixin {
  // VARIABLES
  final zenon = Zenon();
  final seedController = TextEditingController();

  String seed24 = '', seed12 = '';

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void init({bool confirmMode = false}) {
    if (!confirmMode) {
      // generate seed
      generateSeed();
      // show generated seed
      strengthIndexChanged(0);
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
