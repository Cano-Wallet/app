import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import '../utils/my_loggy.dart';

const _exampleMnemonic =
    'route become dream access impulse price inform obtain engage ski believe awful absent pig thing vibrant possible exotic flee pepper marble rural fire fancy';

class PlaygroundScreenController extends GetxController with MyLoggy {
  // PROPERTIES
  final accountIndex = 0.obs;
  final mnemonicStrength = 256.obs;

  final entropy = ''.obs;
  final seed = ''.obs;
  final privateKeyHex = ''.obs;
  final publicKeyHex = ''.obs;
  final addressShort = ''.obs;
  final addressLong = ''.obs;
  final addressHrp = ''.obs;
  final addressCoreBytes = ''.obs;

  // VARIABLES
  final mnemonicController = TextEditingController(text: _exampleMnemonic);

  final accountDropdownItems =
      ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
          .map(
            (e) => DropdownMenuItem(
              child: Text('Key Pair Index: $e'),
              value: e,
            ),
          )
          .toList();

  final mnemonicStrengthDropdownItems = ['128', '256']
      .map((e) =>
          DropdownMenuItem(child: Text('Mnemonic Strength: $e'), value: e))
      .toList();

  // GETTERS

  // INIT

  @override
  void onInit() {
    process();
    super.onInit();
  }

  // FUNCTIONS
  void generate() {
    mnemonicController.text = bip39.generateMnemonic(
      strength: mnemonicStrength.value,
    );

    process();
  }

  void process() async {
    KeyStore? keyStore;

    try {
      keyStore = KeyStore.fromMnemonic(mnemonicController.text);
    } catch (e) {
      return loggy.error(e);
    }

    var keyPair = keyStore.getKeyPair(accountIndex.value);
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

  void mnemonicStrengthChanged(String? value) {
    mnemonicStrength.value = int.parse(value!);
    generate();
  }

  void debug() {
    // final zenon = Zenon();
    // // final wsClient = WsClient();
    // // wsClient.url = 'ws://127.0.0.1:35998';
    // // zenon.ledger.setClient(wsClient);
    // loggy.debug('--- ACCOUNT INFO ---');
    // final accountInfo = await zenon.ledger.getAccountInfoByAddress(address);
    // loggy.info('qsr: ${accountInfo.qsr()}');
    // loggy.info('znn: ${accountInfo.znn()}');

    // loggy.debug('--- BALANCE INFO ---');
    // for (var e in accountInfo.balanceInfoList!) {
    //   loggy.info('token: ${e.token}');
    //   loggy.info('balance: ${e.balance}');
    //   loggy.info('balanceWithDecimals: ${e.balanceWithDecimals}');
    //   loggy.info('balanceFormatted: ${e.balanceFormatted}');
    // }
  }
}
