import 'dart:async';

import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class BalanceCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static BalanceCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final znn = 0.obs;
  final qsr = 0.obs;

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
        await Zenon().ledger.getAccountInfoByAddress(viewingAddress!);
    znn.value = accountInfo.znn()!;
    qsr.value = accountInfo.qsr()!;

    console.info('done');
  }
}
