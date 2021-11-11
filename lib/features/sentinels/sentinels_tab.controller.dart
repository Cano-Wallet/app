import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class SentinelsTabController extends GetxController with ConsoleMixin {
  static SentinelsTabController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final znnRewards = ''.obs;
  final qsrRewards = ''.obs;

  // GETTERS

  // INIT

  // INIT
  @override
  void onReady() {
    fetch();
    super.onReady();
  }

  // FUNCTIONS
  void fetch() async {
    final zenon = Zenon();
    final _rewards =
        await zenon.embedded.sentinel.getUncollectedReward(testAddress);

    znnRewards.value = Utils.formatCurrency(AmountUtils.addDecimals(
      _rewards.znnAmount,
      znnDecimals,
    ));

    qsrRewards.value = Utils.formatCurrency(AmountUtils.addDecimals(
      _rewards.qsrAmount,
      qsrDecimals,
    ));

    console.info('done');
  }

  void spawn() {
    //
  }
}
