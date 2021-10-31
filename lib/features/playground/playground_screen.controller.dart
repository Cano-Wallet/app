import 'package:bip39/bip39.dart' as bip39;
import 'package:example/core/utils/console.dart';
import 'package:example/core/zenon_http_client/zenon_http.dart';
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

  void subscribeToBroadcasts() {
    zenon.wsClient
        .addOnConnectionEstablishedCallback((allResponseBroadcaster) async {
      await allResponseBroadcaster.forEach((e) {
        console.warning('broadcaster: $e');
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
  void wsRequest() async {
    console.info('sending ws request...');

    // clear api result before making the request
    apiResult.value = '';

    /// if web socket client is open and rpc url is changed
    ///
    /// close it before we make the request
    if (!zenon.wsClient.isClosed() &&
        zenon.wsClient.url != rpcUrlController.text) {
      console.warning('stopping web socket');
      zenon.wsClient.stop();
    }

    /// initialize web socket if not
    if (zenon.wsClient.isClosed()) {
      await zenon.wsClient.initialize(
        rpcUrlController.text,
        retry: false,
      );

      /// start subscribing to broadcasts
      // subscribe();
    }

    console.info('JSON-RPC Url: ${rpcUrlController.text}');
    console.info('Method: ${methodController.text}');

    dynamic response;

    try {
      response = await zenon.wsClient.sendRequest(
        methodController.text,
        parseParameters(),
      );
    } catch (e) {
      apiResult.value = e.toString();
      return console.error(e.toString());
    }

    apiResult.value = response.toString();
    console.info('Response: $response');
  }

  /// Sends the request to the API endpoint
  void httpRequest() async {
    console.info('sending http request...');

    // clear api result before making the request
    apiResult.value = '';

    await zenon.httpClient.initialize(rpcUrlController.text);

    console.info('JSON-RPC Url: ${rpcUrlController.text}');
    console.info('Method: ${methodController.text}');

    dynamic response;

    try {
      response = await zenon.httpClient.sendRequest(
        methodController.text,
        parseParameters(),
      );
    } catch (e) {
      apiResult.value = e.toString();
      return console.error(e.toString());
    }

    apiResult.value = response.toString();
    console.info('Response: $response');
  }

  /// demo for making a sdk-native request
  void nativeRequest() async {
    final response =
        await zenon.embedded.pillar.checkNameAvailability('nemoryoliver');
    console.info('native response: $response');
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

    console.info('Parameters: $params');

    return params;
  }

  void info() async {
    console.debug('--- STATS ---');
    final stats = zenon.stats;

    console.warning('Network Info');
    final networkInfo = await stats.networkInfo();
    console.info(
        'network info! id: ${networkInfo.id}, networkId: ${networkInfo.networkId}, name: ${networkInfo.name}, ');

    console.warning('OS Info');
    console.info('os info: ${await stats.osInfo()}');

    console.warning('Process Info');
    final processInfo = await stats.processInfo();
    console.info(
        'process info! pillar: ${processInfo.pillar}, sentinelName: ${processInfo.sentinelName}');

    console.warning('Runtime Info');
    final runtimeInfo = await stats.runtimeInfo();
    console.info(
        'runtime info! timestamp: ${runtimeInfo.frontierMomentum.timestamp}');

    console.warning('Sync Info');
    final syncInfo = await stats.syncInfo();
    console.info('sync info: ${syncInfo.toJson()}');

    // get current address
    final address = Address(
      addressHrp.value,
      HEX.decode(addressCoreBytes.value),
    );

    console.debug('--- ACCOUNT INFO ---');
    // get account info
    final accountInfo = await zenon.ledger.getAccountInfoByAddress(address);
    console.info('address: ${accountInfo.address}');
    console.info('blockCount: ${accountInfo.blockCount}');
    console.info('qsr: ${accountInfo.qsr()}');
    console.info('znn: ${accountInfo.znn()}');

    if (accountInfo.balanceInfoList!.isNotEmpty) {
      console.debug('--- BALANCE INFO ---');
      // iterate through balance info list
      for (var e in accountInfo.balanceInfoList!) {
        console.info('token: ${e.token?.toJson()}');
        console.info('balance: ${e.balance}');
        console.info('balanceWithDecimals: ${e.balanceWithDecimals}');
        console.info('balanceFormatted: ${e.balanceFormatted}');
      }
    }
  }
}
