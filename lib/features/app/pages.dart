import 'package:app/features/about/about.screen.dart';
import 'package:app/features/about/about_screen.controller.dart';
import 'package:app/features/accelerator/accelerator.screen.dart';
import 'package:app/features/accelerator/accelerator_screen.controller.dart';
import 'package:app/features/incentivized/incentivized.screen.dart';
import 'package:app/features/incentivized/incentivized_screen.controller.dart';
import 'package:app/features/main/main.screen.dart';
import 'package:app/features/main/main_screen.binding.dart';
import 'package:app/features/notifications/notifications.screen.dart';
import 'package:app/features/notifications/notifications_screen.controller.dart';
import 'package:app/features/plasma/plasma.screen.dart';
import 'package:app/features/plasma/plasma_screen.controller.dart';
import 'package:app/features/playground/playground.screen.dart';
import 'package:app/features/playground/playground_screen.controller.dart';
import 'package:app/features/settings/peer_list/peer_list.screen.dart';
import 'package:app/features/settings/peer_list/peer_list_screen.controller.dart';
import 'package:app/features/settings/settings.screen.dart';
import 'package:app/features/settings/settings_screen.controller.dart';
import 'package:app/features/tokens/tokens.screen.dart';
import 'package:app/features/tokens/tokens_screen.controller.dart';
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
      name: Routes.plasma,
      page: () => const PlasmaScreen(),
      binding: PlasmaScreenBinding(),
    ),
    GetPage(
      name: Routes.tokens,
      page: () => const TokensScreen(),
      binding: TokensScreenBinding(),
    ),
    GetPage(
      name: Routes.incentivized,
      page: () => const IncentivizedScreen(),
      binding: IncentivizedScreenBinding(),
    ),
    GetPage(
      name: Routes.accelerator,
      page: () => const AcceleratorScreen(),
      binding: AcceleratorScreenBinding(),
    ),

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
