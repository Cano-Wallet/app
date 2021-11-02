import 'package:app/features/about/about.screen.dart';
import 'package:app/features/about/about_screen.controller.dart';
import 'package:app/features/main/main.screen.dart';
import 'package:app/features/main/main_screen.binding.dart';
import 'package:app/features/notifications/notifications.screen.dart';
import 'package:app/features/notifications/notifications_screen.controller.dart';
import 'package:app/features/pillars/pillar_list/pillar_list_screen.controller.dart';
import 'package:app/features/pillars/pillar_list/pillars_list.screen.dart';
import 'package:app/features/plasma/plasma_list/plasma_list.screen.dart';
import 'package:app/features/plasma/plasma_list/plasma_list_screen.controller.dart';
import 'package:app/features/playground/playground.screen.dart';
import 'package:app/features/playground/playground_screen.controller.dart';
import 'package:app/features/sentinels/sentinel_list/sentinel_list.screen.dart';
import 'package:app/features/sentinels/sentinel_list/sentinel_list_screen.controller.dart';
import 'package:app/features/settings/peer_list/peer_list.screen.dart';
import 'package:app/features/settings/peer_list/peer_list_screen.controller.dart';
import 'package:app/features/settings/settings.screen.dart';
import 'package:app/features/settings/settings_screen.controller.dart';
import 'package:app/features/staking/staking_list/staking_list.screen.dart';
import 'package:app/features/staking/staking_list/staking_list_screen.controller.dart';
import 'package:app/features/tokens/token_list/token_list.screen.dart';
import 'package:app/features/tokens/token_list/token_list_screen.controller.dart';
import 'package:app/features/wallet/confirm/confirm_seed.screen.dart';
import 'package:app/features/wallet/confirm/confirm_seed_screen.controller.dart';
import 'package:app/features/wallet/create/create_wallet.screen.dart';
import 'package:app/features/wallet/create/create_wallet_screen.controller.dart';
import 'package:app/features/wallet/import/import_wallet.screen.dart';
import 'package:app/features/wallet/import/import_wallet_screen.controller.dart';
import 'package:app/features/wallet/reset/reset_wallet.screen.dart';
import 'package:app/features/wallet/reset/reset_wallet_screen.controller.dart';
import 'package:app/features/welcome/welcome.screen.dart';
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
    GetPage(
      name: Routes.resetWallet,
      page: () => const ResetWalletScreen(),
      binding: ResetWalletScreenBinding(),
    ),

    // SCREENS
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
    ),
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
    GetPage(
      name: Routes.about,
      page: () => const AboutScreen(),
      binding: AboutScreenBinding(),
    ),

    // PLAYGROUND
    GetPage(
      name: Routes.playground,
      page: () => const PlaygroundScreen(),
      binding: PlaygroundScreenBinding(),
    ),
  ];
}
