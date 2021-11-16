import 'package:cano/core/managers/zenon.manager.dart';
import 'package:cano/features/general/centered_placeholder.widget.dart';
import 'package:cano/features/wallet/reset/reset_wallet_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ResetWalletScreen extends GetView<ResetWalletScreenController> {
  const ResetWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: CenteredPlaceholder(
          iconData: LineIcons.exclamationTriangle,
          message:
              'All your wallet data will be erased permanently. Make sure you have a backup of your seed and passphrase before you proceed with erasing the wallet',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: Get.back,
                label: const Text('Cancel'),
                icon: const Icon(LineIcons.times),
              ),
              const SizedBox(width: 20),
              TextButton.icon(
                onPressed: ZenonManager.reset,
                label: const Text('Reset'),
                icon: const Icon(LineIcons.syncIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
