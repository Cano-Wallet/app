import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import '../utils/my_loggy.dart';

const _exampleMnemonic =
    'route become dream access impulse price inform obtain engage ski believe awful absent pig thing vibrant possible exotic flee pepper marble rural fire fancy';

const _rpcUrlEndpoint = 'ws://127.0.0.1:35998';
const _exampleEndpoint = 'embedded.pillar.checkNameAvailability';
const _exampleParameters = 'nemoryoliver';

class PlaygroundScreenController extends GetxController with MyLoggy {
  // PROPERTIES

  /// Key-Pair / Account Index
  final accountIndex = 0.obs; // default to the main account/key-pair index

  /// Set the strength of the mnemonic phrase
  ///
  /// 256 for 24 word, 128 for 12 word
  final mnemonicStrength = 256.obs; // default to 24 word phrase

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
  final rpcUrlController = TextEditingController(text: _rpcUrlEndpoint);
  final endpointController = TextEditingController(text: _exampleEndpoint);
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

  final mnemonicStrengthDropdownItems = ['128', '256']
      .map(
        (e) => DropdownMenuItem(
          child: Text('Mnemonic Strength: $e'),
          value: e,
        ),
      )
      .toList();

  // GETTERS

  // INIT

  @override
  void onInit() async {
    subscribeToBroadcasts();
    process(); // process the initial parameters on app start
    super.onInit();
  }

  // FUNCTIONS

  /// Generate mnemonic phrase
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

  void mnemonicStrengthChanged(String? value) {
    mnemonicStrength.value = int.parse(value!);
    generate();
  }

  void subscribeToBroadcasts() {
    zenon.wsClient
        .addOnConnectionEstablishedCallback((allResponseBroadcaster) async {
      await allResponseBroadcaster.forEach((e) {
        loggy.warning('broadcaster: $e');
      });
    });
  }

  /// subscribe to broadcasts
  void subscribe() async {
    await zenon.subscribe.toMomentums();

    // get current address
    final address = Address(
      addressHrp.value,
      HEX.decode(addressCoreBytes.value),
    );

    await zenon.subscribe.toAccountEvents(address);
    await zenon.subscribe.toAllAccountEvents(address);
    await zenon.subscribe.toUnreceivedAccountBlocks(address);
  }

  /// Sends the request to the API endpoint
  void request() async {
    // clear api result before making the request
    apiResult.value = '';

    /// if web socket client is open and rpc url is changed
    ///
    /// close it before we make the request
    if (!zenon.wsClient.isClosed() &&
        zenon.wsClient.url != rpcUrlController.text) {
      loggy.warning('stopping web socket');
      zenon.wsClient.stop();
    }

    /// initialize web socket if not
    if (zenon.wsClient.isClosed()) {
      await zenon.wsClient.initialize(
        rpcUrlController.text,
        retry: false,
      );

      /// start subscribing to broadcasts
      subscribe();
    }

    loggy.info('JSON-RPC Url: ${rpcUrlController.text}');
    loggy.info('Endpoint: ${endpointController.text}');

    dynamic response;

    try {
      response = await zenon.wsClient.sendRequest(
        endpointController.text,
        parseParameters(),
      );
    } catch (e) {
      apiResult.value = e.toString();
      return loggy.error(e);
    }

    apiResult.value = response.toString();
    loggy.info('Response: $response');
  }

  /// demo for making a sdk-native request
  void nativeRequest() async {
    final response =
        await zenon.embedded.pillar.checkNameAvailability('nemoryoliver');
    loggy.info('native response: $response');
  }

  /// Parse multi-type array parameters
  ///
  /// accepts String, int, double
  List<dynamic> parseParameters() {
    final splittedParams = parametersController.text.split(',');

    List<dynamic> params = [];

    for (var e in splittedParams) {
      if (e.toLowerCase().isBool) {
        params.add(e == 'true');
      } else if (e.isNum) {
        if (e.contains('.')) {
          params.add(double.parse(e));
        } else {
          params.add(int.parse(e));
        }
      } else {
        params.add(e); // string
      }
    }

    loggy.info('Parameters: $params');

    return params;
  }

  void info() async {
    loggy.debug('--- STATS ---');
    final stats = zenon.stats;

    loggy.warning('Network Info');
    final networkInfo = await stats.networkInfo();
    loggy.info(
        'network info! id: ${networkInfo.id}, networkId: ${networkInfo.networkId}, name: ${networkInfo.name}, ');

    loggy.warning('OS Info');
    loggy.info('os info: ${await stats.osInfo()}');

    loggy.warning('Process Info');
    final processInfo = await stats.processInfo();
    loggy.info(
        'process info! pillar: ${processInfo.pillar}, sentinelName: ${processInfo.sentinelName}');

    loggy.warning('Runtime Info');
    final runtimeInfo = await stats.runtimeInfo();
    loggy.info(
        'runtime info! timestamp: ${runtimeInfo.frontierMomentum.timestamp}');

    loggy.warning('Sync Info');
    final syncInfo = await stats.syncInfo();
    loggy.info('sync info: ${syncInfo.toJson()}');

    // get current address
    final address = Address(
      addressHrp.value,
      HEX.decode(addressCoreBytes.value),
    );

    loggy.debug('--- ACCOUNT INFO ---');
    // get account info
    final accountInfo = await zenon.ledger.getAccountInfoByAddress(address);
    loggy.info('address: ${accountInfo.address}');
    loggy.info('blockCount: ${accountInfo.blockCount}');
    loggy.info('qsr: ${accountInfo.qsr()}');
    loggy.info('znn: ${accountInfo.znn()}');

    if (accountInfo.balanceInfoList!.isNotEmpty) {
      loggy.debug('--- BALANCE INFO ---');
      // iterate through balance info list
      for (var e in accountInfo.balanceInfoList!) {
        loggy.info('token: ${e.token}');
        loggy.info('balance: ${e.balance}');
        loggy.info('balanceWithDecimals: ${e.balanceWithDecimals}');
        loggy.info('balanceFormatted: ${e.balanceFormatted}');
      }
    }
  }
}
