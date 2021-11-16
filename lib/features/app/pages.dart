import 'package:cano/features/about/about.screen.dart';
import 'package:cano/features/about/about_screen.controller.dart';
import 'package:cano/features/accelerator/accelerator.screen.dart';
import 'package:cano/features/accelerator/accelerator_screen.controller.dart';
import 'package:cano/features/addresses/addresses.screen.dart';
import 'package:cano/features/addresses/addresses_screen.controller.dart';
import 'package:cano/features/contacts/contacts.screen.dart';
import 'package:cano/features/contacts/contacts_screen.controller.dart';
import 'package:cano/features/incentivized/incentivized.screen.dart';
import 'package:cano/features/incentivized/incentivized_screen.controller.dart';
import 'package:cano/features/main/main.screen.dart';
import 'package:cano/features/main/main_screen.binding.dart';
import 'package:cano/features/notifications/notifications.screen.dart';
import 'package:cano/features/notifications/notifications_screen.controller.dart';
import 'package:cano/features/peers/peers.screen.dart';
import 'package:cano/features/peers/peers_screen.controller.dart';
import 'package:cano/features/pillars/spawn/spawn.screen.dart';
import 'package:cano/features/pillars/spawn/spawn_screen.controller.dart';
import 'package:cano/features/plasma/plasma.screen.dart';
import 'package:cano/features/plasma/plasma_screen.controller.dart';
import 'package:cano/features/playground/playground.screen.dart';
import 'package:cano/features/playground/playground_screen.controller.dart';
import 'package:cano/features/sentinels/spawn/spawn.screen.dart';
import 'package:cano/features/sentinels/spawn/spawn_screen.controller.dart';
import 'package:cano/features/settings/settings.screen.dart';
import 'package:cano/features/settings/settings_screen.controller.dart';
import 'package:cano/features/staking/stake/stake.screen.dart';
import 'package:cano/features/staking/stake/stake_screen.controller.dart';
import 'package:cano/features/tokens/tokens.screen.dart';
import 'package:cano/features/tokens/tokens_screen.controller.dart';
import 'package:cano/features/transfer/send/send.screen.dart';
import 'package:cano/features/transfer/send/send_screen.controller.dart';
import 'package:cano/features/viewing_address/viewing_address.screen.dart';
import 'package:cano/features/wallet/confirm/confirm_seed.screen.dart';
import 'package:cano/features/wallet/confirm/confirm_seed_screen.controller.dart';
import 'package:cano/features/wallet/create/create_wallet.screen.dart';
import 'package:cano/features/wallet/create/create_wallet_screen.controller.dart';
import 'package:cano/features/wallet/create_password/create_password.screen.dart';
import 'package:cano/features/wallet/create_password/create_password_screen.controller.dart';
import 'package:cano/features/wallet/import/import_wallet.screen.dart';
import 'package:cano/features/wallet/import/import_wallet_screen.controller.dart';
import 'package:cano/features/wallet/import/unlock_vault/unlock_vault.screen.dart';
import 'package:cano/features/wallet/import/unlock_vault/unlock_vault_screen.controller.dart';
import 'package:cano/features/wallet/reset/reset_wallet.screen.dart';
import 'package:cano/features/wallet/reset/reset_wallet_screen.controller.dart';
import 'package:cano/features/wallet/unlock/unlock_wallet.screen.dart';
import 'package:cano/features/wallet/unlock/unlock_wallet_screen.controller.dart';
import 'package:cano/features/welcome/welcome.screen.dart';
import 'package:cano/features/welcome/welcome_screen.controller.dart';
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
      name: Routes.peers,
      page: () => const PeersScreen(),
      binding: PeersScreenBinding(),
    ),
    GetPage(
      name: Routes.addresses,
      page: () => const AddressesScreen(),
      binding: AddressesScreenBinding(),
    ),
    GetPage(
      name: Routes.contacts,
      page: () => const ContactsScreen(),
      binding: ContactsScreenBinding(),
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
      name: Routes.unlockVault,
      page: () => const UnlockVaultScreen(),
      binding: UnlockVaultScreenBinding(),
    ),
    GetPage(
      name: Routes.confirmSeed,
      page: () => const ConfirmSeedScreen(),
      binding: ConfirmSeedScreenBinding(),
    ),
    GetPage(
      name: Routes.unlockWallet,
      page: () => const UnlockWalletScreen(),
      binding: UnlockWalletScreenBinding(),
    ),
    GetPage(
      name: Routes.resetWallet,
      page: () => const ResetWalletScreen(),
      binding: ResetWalletScreenBinding(),
    ),
    GetPage(
      name: Routes.createPassword,
      page: () => const CreateWalletPasswordScreen(),
      binding: CreateWalletPasswordScreenBinding(),
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
      name: Routes.send,
      page: () => const SendScreen(),
      binding: SendScreenBinding(),
    ),
    GetPage(
      name: Routes.stake,
      page: () => const StakeScreen(),
      binding: StakeScreenBinding(),
    ),
    GetPage(
      name: Routes.spawnPillar,
      page: () => const SpawnPillarScreen(),
      binding: SpawnPillarScreenBinding(),
    ),
    GetPage(
      name: Routes.spawnSentinel,
      page: () => const SpawnSentinelScreen(),
      binding: SpawnSentinelScreenBinding(),
    ),

    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
      binding: WelcomeScreenBinding(),
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

    // OTHERS
    GetPage(
      name: Routes.viewingAddress,
      page: () => const ViewingAddressScreen(),
    ),
  ];
}
