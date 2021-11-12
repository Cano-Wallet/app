import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class StakingTabController extends GetxController with ConsoleMixin {
  static StakingTabController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final qsrRewards = ''.obs;

  // GETTERS

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
        await zenon.embedded.stake.getUncollectedReward(testAddress);

    qsrRewards.value = Utils.formatCurrency(AmountUtils.addDecimals(
      _rewards.qsrAmount,
      qsrDecimals,
    ));

    console.info('done');
  }
}
