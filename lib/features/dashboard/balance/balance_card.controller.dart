import 'dart:async';

import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class BalanceCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static BalanceCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final result = 'ZNN: 0, QSR: 0'.obs;

  // GETTERS

  // INIT

  // FUNCTIONS
  Future<void> fetch() async {
    final address = Address.parse(kTestAddress);
    final accountInfo = await Zenon().ledger.getAccountInfoByAddress(address);

    final znn = AmountUtils.addDecimals(accountInfo.znn()!, znnDecimals);
    final qsr = AmountUtils.addDecimals(accountInfo.qsr()!, qsrDecimals);

    result.value = 'ZNN: $znn, QSR: $qsr';
    console.info('done');
  }
}
