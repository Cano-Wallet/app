import 'package:bip39/bip39.dart' as bip39;
import 'package:example/core/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

const _exampleMnemonic =
    'route become dream access impulse price inform obtain engage ski believe awful absent pig thing vibrant possible exotic flee pepper marble rural fire fancy';

const _rpcUrl = 'ws://188.166.15.29:35998';
const _exampleMethod = 'embedded.pillar.checkNameAvailability';
const _exampleParameters = 'nemoryoliver';

class PlaygroundScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaygroundScreenController());
  }
}

class PlaygroundScreenController extends GetxController with ConsoleMixin {
  // PROPERTIES

  /// Key-Pair / Account Index
  final accountIndex = 0.obs; // default to the main account/key-pair index

  /// Set the strength of the mnemonic phrase
  ///
  /// 256 for 24 word, 128 for 12 word
  final seedStrength = 256.obs; // default to 24 word phrase

  /// this holds the request's response to be displayed
  final apiResult = ''.obs;

  final entropy = ''.obs;
  final seed = ''.obs;
  final privateKeyHex = ''.obs;
  final publicKeyHex = ''.obs;
  final addressShort = ''.obs;
  final addressLong = ''.obs;
  final addressHrp = ''.obs;
  final addressCoreBytes = ''.obs;

  // VARIABLES
  final zenon = Zenon();

  final mnemonicController = TextEditingController(text: _exampleMnemonic);
  final rpcUrlController = TextEditingController(text: _rpcUrl);
  final methodController = TextEditingController(text: _exampleMethod);
  final parametersController = TextEditingController(text: _exampleParameters);

  final accountDropdownItems =
      ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          .map(
            (e) => DropdownMenuItem(
              child: Text('Key Pair Index: $e'),
              value: e,
            ),
          )
          .toList();

  final seedStrengthDropdownItems = ['128', '256']
      .map(
        (e) => DropdownMenuItem(
          child: Text('Strength: $e'),
          value: e,
        ),
      )
      .toList();

  // GETTERS

  // INIT

  @override
  void onInit() async {
    // subscribeToBroadcasts();
    process(); // process the initial parameters on app start
    super.onInit();
  }

  // FUNCTIONS

  /// Generate mnemonic phrase
  void generate() {
    mnemonicController.text = bip39.generateMnemonic(
      strength: seedStrength.value,
    );

    process();
  }

  void process() async {
    KeyStore? keyStore;

    try {
      keyStore = KeyStore.fromMnemonic(mnemonicController.text);
    } catch (e) {
      return console.error(e.toString());
    }

    final keyPair = keyStore.getKeyPair(accountIndex.value);
    final _address = await keyPair.address;
    addressShort.value = _address!.toShortString();
    addressLong.value = _address.toString();

    addressHrp.value = _address.hrp!;
    addressCoreBytes.value = HEX.encode(_address.core!);

    final privateKey = keyPair.getPrivateKey();
    privateKeyHex.value = HEX.encode(privateKey!);

    final publicKey = await keyPair.getPublicKey();
    publicKeyHex.value = HEX.encode(publicKey!);

    entropy.value = keyStore.entropy;
    seed.value = keyStore.seed!;
  }

  void accountChanged(String? value) {
    accountIndex.value = int.parse(value!);
    process();
  }

  void seedStrengthChanged(String? value) {
    seedStrength.value = int.parse(value!);
    generate();
  }
}
