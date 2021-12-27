import 'package:cano/core/utils/console.dart';
import 'package:cano/core/zenon_http_client/zenon_http.dart';
import 'package:cano/features/playground/wallet/wallet_playground.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

const _rpcUrl = 'ws://chadasscapital.com:35998';
const _exampleMethod = 'embedded.pillar.checkNameAvailability';
const _exampleParameters = 'nemoryoliver';

class APIPlaygroundController extends GetxController with ConsoleMixin {
  // VARIABLES
  final zenon = Zenon();

  final rpcUrlController = TextEditingController(text: _rpcUrl);
  final methodController = TextEditingController(text: _exampleMethod);
  final parametersController = TextEditingController(text: _exampleParameters);

  /// this holds the request's response to be displayed
  final apiResult = ''.obs;

  // FUNCTIONS

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
    final address =
        Address.parse(WalletPlaygroundController.to.addressLong.value);

    await zenon.subscribe.toAccountEvents(address);
    await zenon.subscribe.toAllAccountEvents();
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

    final token =
        await zenon.embedded.token.getByZts(TokenStandard.bySymbol('ZNN'));
    console.warning('Token: ${token!.toJson()}');

    console.warning('Network Info');
    final networkInfo = await stats.networkInfo();
    console.info(
        'network info! IP: ${networkInfo.self.ip}, Address: ${networkInfo.self.publicKey}, Peers: ${networkInfo.numPeers} ');

    console.warning('OS Info');
    final osInfo = await stats.osInfo();
    console.info('os: ${osInfo.os}');
    console.info('platform: ${osInfo.platform}');
    console.info('platformVersion: ${osInfo.platformVersion}');
    console.info('kernelVersion: ${osInfo.kernelVersion}');
    console.info('memoryTotal: ${osInfo.memoryTotal}');
    console.info('memoryFree: ${osInfo.memoryFree}');
    console.info('numCPU: ${osInfo.numCPU}');
    console.info('numGoroutine: ${osInfo.numGoroutine}');

    console.warning('Process Info');
    final processInfo = await stats.processInfo();
    console.info(
        'process info! commit: ${processInfo.commit}, version: ${processInfo.version}');

    // get current address
    final address =
        Address.parse(WalletPlaygroundController.to.addressLong.value);

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
