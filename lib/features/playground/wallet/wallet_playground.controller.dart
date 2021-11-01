import 'dart:io';

import 'package:bip39/bip39.dart' as bip39;
import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/globals.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/core/zenon.manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

const _exampleMnemonic =
    'route become dream access impulse price inform obtain engage ski believe awful absent pig thing vibrant possible exotic flee pepper marble rural fire fancy';

class WalletPlaygroundController extends GetxController with ConsoleMixin {
  static WalletPlaygroundController get to => Get.find();
  // PROPERTIES

  /// Key-Pair / Account Index
  final accountIndex = 0.obs; // default to the main account/key-pair index

  /// Set the strength of the mnemonic phrase
  ///
  /// 256 for 24 word, 128 for 12 word
  final seedStrength = 256.obs; // default to 24 word phrase

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

  KeyStore? keyStore;

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
    try {
      keyStore = KeyStore.fromMnemonic(mnemonicController.text);
    } catch (e) {
      return console.error(e.toString());
    }

    // set as default
    zenon.defaultKeyStore = keyStore;

    final keyPair = keyStore!.getKeyPair(accountIndex.value);

    final _address = await keyPair.address;
    addressShort.value = _address!.toShortString();
    addressLong.value = _address.toString();

    addressHrp.value = _address.hrp!;
    addressCoreBytes.value = HEX.encode(_address.core!);

    final privateKey = keyPair.getPrivateKey();
    privateKeyHex.value = HEX.encode(privateKey!);

    final publicKey = await keyPair.getPublicKey();
    publicKeyHex.value = HEX.encode(publicKey!);

    entropy.value = keyStore!.entropy;
    seed.value = keyStore!.seed!;
  }

  void accountChanged(String? value) {
    accountIndex.value = int.parse(value!);
    process();
  }

  void seedStrengthChanged(String? value) {
    seedStrength.value = int.parse(value!);
    generate();
  }

  void subscribeToBroadcasts() {
    zenon.wsClient
        .addOnConnectionEstablishedCallback((allResponseBroadcaster) async {
      await allResponseBroadcaster.forEach((e) {
        console.warning('broadcaster: $e');
      });
    });
  }

  //

  void info() async {
    console.info('defaultKeyPair: ${zenon.defaultKeyPair?.address.toString()}');
    console.info('defaultKeyStore: ${zenon.defaultKeyStore?.mnemonic}');
    console.info('defaultKeyStorePath: ${zenon.defaultKeyStorePath?.path}');

    console.info(
        'keyStoreInUse: ${zenon.keyStoreManager.keyStoreInUse?.mnemonic}');
    console.info('walletPath: ${zenon.keyStoreManager.walletPath?.path}');

    List<File>? keyStores;

    try {
      keyStores = await zenon.keyStoreManager.listAllKeyStores();
    } catch (e) {
      return console.error(e.toString());
    }

    console.info('keystores: ${keyStores.length}');
  }

  void createKeyStore() async {
    final file = await zenon.keyStoreManager.createFromMnemonic(
      mnemonicController.text,
      kTestPassword,
      'testName',
    );

    console.info('created: ${file.path}');
  }

  void open() async {
    final keyStores = await zenon.keyStoreManager.listAllKeyStores();

    try {
      keyStore = await zenon.keyStoreManager.readKeyStore(
        kTestPassword,
        keyStores.first,
      );
    } catch (e) {
      return console.error(e.toString());
    }

    console.info('keyStore: ${keyStore!.mnemonic}');

    // re-process to display
    mnemonicController.text = keyStore!.mnemonic!;
    process();
  }

  void importKeyStoreFile() async {
    final file = await Utils.pickKeyStoreFile();
    if (file == null) return;
    console.info('file: ${file.path}');

    try {
      keyStore = await zenon.keyStoreManager.readKeyStore(kTestPassword, file);
    } catch (e) {
      return console.error(e.toString());
    }

    console.info('keyStore: ${keyStore!.mnemonic}');

    // re-process to display
    mnemonicController.text = keyStore!.mnemonic!;
    process();
  }

  void send() async {
    final recipient = Address.parse('z1qqjgxp2qmj3w6ehqq9lpg2g5vepwpp8th803wj');
    final token = TokenStandard.bySymbol('QSR');
    const amount = 1;

    final accountBlockTemplate = AccountBlockTemplate.send(
      recipient,
      token,
      amount,
    );

    AccountBlock? accountBlock;

    try {
      accountBlock = await zenon.send(
        accountBlockTemplate,
        currentKeyPair: keyStore?.getKeyPair(accountIndex.value),
        generatingPowCallback: (powStatus) {
          console.info('pow status: ${powStatus.toString()}');
        },
      );
    } catch (e) {
      return console.error(e.toString());
    }

    console.info('accountBlock: ${accountBlock.toJson()}');
  }
}
