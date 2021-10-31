import 'package:example/features/main/main.screen.dart';
import 'package:example/features/main/main_screen.binding.dart';
import 'package:example/features/notifications/notifications.screen.dart';
import 'package:example/features/notifications/notifications_screen.controller.dart';
import 'package:example/features/pillars/pillar_list/pillar_list_screen.controller.dart';
import 'package:example/features/pillars/pillar_list/pillars_list.screen.dart';
import 'package:example/features/plasma/plasma_list/plasma_list.screen.dart';
import 'package:example/features/plasma/plasma_list/plasma_list_screen.controller.dart';
import 'package:example/features/playground/playground.screen.dart';
import 'package:example/features/playground/playground_screen.controller.dart';
import 'package:example/features/sentinels/sentinel_list/sentinel_list.screen.dart';
import 'package:example/features/sentinels/sentinel_list/sentinel_list_screen.controller.dart';
import 'package:example/features/settings/peer_list/peer_list.screen.dart';
import 'package:example/features/settings/peer_list/peer_list_screen.controller.dart';
import 'package:example/features/settings/settings.screen.dart';
import 'package:example/features/settings/settings_screen.controller.dart';
import 'package:example/features/staking/staking_list/staking_list.screen.dart';
import 'package:example/features/staking/staking_list/staking_list_screen.controller.dart';
import 'package:example/features/tokens/token_list/token_list.screen.dart';
import 'package:example/features/tokens/token_list/token_list_screen.controller.dart';
import 'package:example/features/wallet/confirm/confirm_seed.screen.dart';
import 'package:example/features/wallet/confirm/confirm_seed_screen.controller.dart';
import 'package:example/features/wallet/create/create_wallet.screen.dart';
import 'package:example/features/wallet/create/create_wallet_screen.controller.dart';
import 'package:example/features/wallet/import/import_wallet.screen.dart';
import 'package:example/features/wallet/import/import_wallet_screen.controller.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const initial = Routes.main;

  static final routes = [
    // MAIN
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
    // LISTS
    GetPage(
      name: Routes.pillarList,
      page: () => const PillarListScreen(),
      binding: PillarListScreenBinding(),
    ),
    GetPage(
      name: Routes.sentinelList,
      page: () => const SentinelListScreen(),
      binding: SentinelListScreenBinding(),
    ),
    GetPage(
      name: Routes.stakingList,
      page: () => const StakingListScreen(),
      binding: StakingListScreenBinding(),
    ),
    GetPage(
      name: Routes.plasmaList,
      page: () => const PlasmaListScreen(),
      binding: PlasmaListScreenBinding(),
    ),
    GetPage(
      name: Routes.tokenList,
      page: () => const TokenListScreen(),
      binding: TokenListScreenBinding(),
    ),
    GetPage(
      name: Routes.peerList,
      page: () => const PeerListScreen(),
      binding: PeerListScreenBinding(),
    ),
    // WALLET SCREENS
    GetPage(
      name: Routes.createWallet,
      page: () => const CreateWalletScreen(),
      binding: CreateWalletScreenBinding(),
    ),
    GetPage(
      name: Routes.importWallet,
      page: () => const ImportWalletScreen(),
      binding: ImportWalletScreenBinding(),
    ),
    GetPage(
      name: Routes.confirmSeed,
      page: () => const ConfirmSeedScreen(),
      binding: ConfirmSeedScreenBinding(),
    ),
    // SCREENS
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationsScreen(),
      binding: NotificationsScreenBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      binding: SettingsScreenBinding(),
    ),
    // PLAYGROUND
    GetPage(
      name: Routes.playground,
      page: () => const PlaygroundScreen(),
      binding: PlaygroundScreenBinding(),
    ),
  ];
}
