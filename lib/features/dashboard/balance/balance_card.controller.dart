import 'dart:async';

import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class BalanceCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static BalanceCardController get to => Get.find();

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
    final accountInfo =
        await Zenon().ledger.getAccountInfoByAddress(testAddress);

    znn.value = Utils.formatCurrency(AmountUtils.addDecimals(
      accountInfo.znn()!,
      znnDecimals,
    ));

    qsr.value = Utils.formatCurrency(AmountUtils.addDecimals(
      accountInfo.qsr()!,
      qsrDecimals,
    ));

    console.info('done');
  }
}
