import 'dart:async';

import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class DelegationStatsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static DelegationStatsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final name = ''.obs;
  final weight = ''.obs;

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

    DelegationInfo? delegationInfo;

    try {
      delegationInfo =
          await zenon.embedded.pillar.getDelegatedPillar(testAddress);
    } catch (e) {
      return console.error(e.toString());
    }

    if (delegationInfo == null) return console.error('null delegation info');

    name.value = delegationInfo.name;
    weight.value = Utils.formatCurrency(AmountUtils.addDecimals(
      delegationInfo.weight,
      znnDecimals,
    ));

    console.info('done');
  }
}
