import 'package:example/features/dashboard/balance/balance_card.controller.dart';
import 'package:example/features/dashboard/dashboard_tab.controller.dart';
import 'package:example/features/dashboard/delegation_stats/staking_stats/delegation_stats_card.controller.dart';
import 'package:example/features/dashboard/dual_coin_stats/dual_coin_stats_card.controller.dart';
import 'package:example/features/dashboard/pillars/pillars_card.controller.dart';
import 'package:example/features/dashboard/sentinels/sentinels_card.controller.dart';
import 'package:example/features/dashboard/staking_stats/staking_stats_card.controller.dart';
import 'package:example/features/pillars/pillars_tab.controller.dart';
import 'package:example/features/plasma/plasma_tab.controller.dart';
import 'package:example/features/sentinels/sentinels_tab.controller.dart';
import 'package:example/features/staking/staking_tab.controller.dart';
import 'package:example/features/tokens/tokens_tab.controller.dart';
import 'package:example/features/transfer/transfer_tab.controller.dart';
import 'package:example/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:get/get.dart';

import 'main_screen.controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());

    // CARD CONTROLLERS
    Get.create(() => PassphraseCardController());
    Get.create(() => BalanceCardController());
    Get.create(() => DualCoinStatsCardController());
    Get.create(() => PillarsCardController());
    Get.create(() => StakingStatsCardController());
    Get.create(() => SentinelsCardController());
    Get.create(() => DelegationStatsCardController());

    // TAB CONTROLLERS
    Get.put(DashboardTabController());
    Get.put(TransferTabController());
    Get.put(PillarsTabController());
    Get.put(SentinelsTabController());
    Get.put(StakingTabController());
    Get.put(PlasmaTabController());
    Get.put(TokensTabController());
  }
}
