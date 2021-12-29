import 'dart:async';

import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class StakingStatsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static StakingStatsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final entriesCount = '...'.obs;
  final entriesTotalAmount = '...'.obs;

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

    final entries =
        await zenon.embedded.stake.getEntriesByAddress(viewingAddress!);
    entriesCount.value = entries.count.toString();

    entriesTotalAmount.value = Utils.formatCurrency(AmountUtils.addDecimals(
      entries.totalAmount,
      znnDecimals,
    ));

    // final uncollectedRewards =
    //     await zenon.embedded.stake.getUncollectedReward(address);
    // final frontierRewards =
    //     await zenon.embedded.stake.getFrontierRewardByPage(address);

    // result.value = '''
    // Entries: ${entries.count}, ${AmountUtils.addDecimals(entries.totalAmount, znnDecimals)} ZNN
    // Frontier Rewards! ZNN: ${frontierRewards.count}
    // Uncollected Rewards! ZNN: ${AmountUtils.addDecimals(uncollectedRewards.znnAmount, znnDecimals)}, QSR: ${AmountUtils.addDecimals(uncollectedRewards.qsrAmount, qsrDecimals)}''';
    console.info('done');
  }
}
