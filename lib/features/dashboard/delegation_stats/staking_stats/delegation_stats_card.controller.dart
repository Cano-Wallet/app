import 'dart:async';

import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/globals.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class DelegationStatsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static DelegationStatsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final result = '0'.obs;

  // GETTERS

  // INIT

  // FUNCTIONS
  Future<void> fetch() async {
    final zenon = Zenon();
    final address = Address.parse(kTestAddress);

    final delegationInfo =
        await zenon.embedded.pillar.getDelegatedPillar(address);
    if (delegationInfo == null) return console.error('null delegation info');

    result.value = '''
    Name: ${delegationInfo.name}
    Status: ${delegationInfo.status}
    Weight: ${AmountUtils.addDecimals(delegationInfo.weight, znnDecimals)} ZNN
    Active: ${delegationInfo.isPillarActive()}''';

    console.info('done');
  }
}
