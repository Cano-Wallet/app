import 'dart:async';

import 'package:cano/core/providers/coingecko/coingecko_api.provider.dart';
import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class DualCoinStatsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static DualCoinStatsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final znn = 0.obs;
  final qsr = 0.obs;

  final znnPrice = 0.0.obs;

  // GETTERS

  // INIT
  @override
  void onReady() {
    fetch();
    super.onReady();
  }

  // FUNCTIONS
  Future<void> fetch() async {
    final zenon = Zenon();

    final znnToken =
        await zenon.embedded.token.getByZts(TokenStandard.bySymbol('ZNN'));
    znn.value = znnToken?.totalSupply ?? 0;

    final qsrToken =
        await zenon.embedded.token.getByZts(TokenStandard.bySymbol('QSR'));
    qsr.value = qsrToken?.totalSupply ?? 0;
  }

  Future<void> fetchZNNPrice() async {
    final coingecko = CoinGeckoApiProvider();

    coingecko.fetchZNNPrice().then((value) {
      znnPrice.value = value.zenon.usd;
    }).onError((error, stackTrace) {
      console.error('error 2: $error');
    });
  }
}
