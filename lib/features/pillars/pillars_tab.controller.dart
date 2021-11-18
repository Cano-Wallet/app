import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PillarsTabController extends GetxController with ConsoleMixin {
  static PillarsTabController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final znnRewards = ''.obs;

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
        await zenon.embedded.pillar.getUncollectedReward(viewingAddress!);

    znnRewards.value = Utils.formatCurrency(AmountUtils.addDecimals(
      _rewards.znnAmount,
      znnDecimals,
    ));

    console.info('done');
  }
}
