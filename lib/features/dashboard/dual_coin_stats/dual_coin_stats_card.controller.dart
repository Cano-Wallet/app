import 'dart:async';

import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class DualCoinStatsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static DualCoinStatsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final znn = ''.obs;
  final qsr = ''.obs;

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
        await zenon.embedded.token.getByZts(TokenStandard.bySymbol('tZNN'));
    znn.value = Utils.formatNumber(znnToken!.totalSupply);

    final qsrToken =
        await zenon.embedded.token.getByZts(TokenStandard.bySymbol('tQSR'));
    qsr.value = Utils.formatNumber(qsrToken!.totalSupply);

    console.info('done');
  }
}
