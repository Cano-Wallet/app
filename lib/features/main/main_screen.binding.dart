import 'package:app/features/dashboard/balance/balance_card.controller.dart';
import 'package:app/features/dashboard/dashboard_tab.controller.dart';
import 'package:app/features/dashboard/delegation_stats/staking_stats/delegation_stats_card.controller.dart';
import 'package:app/features/dashboard/dual_coin_stats/dual_coin_stats_card.controller.dart';
import 'package:app/features/dashboard/pillars/pillars_card.controller.dart';
import 'package:app/features/dashboard/sentinels/sentinels_card.controller.dart';
import 'package:app/features/dashboard/staking_stats/staking_stats_card.controller.dart';
import 'package:app/features/pillars/pillars_tab.controller.dart';
import 'package:app/features/plasma/plasma_tab.controller.dart';
import 'package:app/features/sentinels/sentinels_tab.controller.dart';
import 'package:app/features/staking/staking_tab.controller.dart';
import 'package:app/features/tokens/tokens_tab.controller.dart';
import 'package:app/features/transfer/transfer_tab.controller.dart';
import 'package:app/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:get/get.dart';

import 'main_screen.controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());

    // TAB CONTROLLERS
    Get.lazyPut(() => DashboardTabController());
    Get.lazyPut(() => TransferTabController());
    Get.lazyPut(() => PillarsTabController());
    Get.lazyPut(() => SentinelsTabController());
    Get.lazyPut(() => StakingTabController());
    Get.lazyPut(() => PlasmaTabController());
    Get.lazyPut(() => TokensTabController());

    // CARD CONTROLLERS
    Get.lazyPut(() => BalanceCardController());
    Get.lazyPut(() => DualCoinStatsCardController());
    Get.lazyPut(() => PillarsCardController());
    Get.lazyPut(() => StakingStatsCardController());
    Get.lazyPut(() => SentinelsCardController());
    Get.lazyPut(() => DelegationStatsCardController());

    // GET WIDGETS
    Get.create(() => PassphraseCardController());
  }
}
