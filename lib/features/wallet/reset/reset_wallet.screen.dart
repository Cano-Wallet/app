import 'package:app/features/general/centered_placeholder.widget.dart';
import 'package:app/features/wallet/reset/reset_wallet_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          iconData: Icons.warning,
          message:
              'All your wallet data will be erased permanently. Make sure you have a backup of your seed and passphrase before you proceed with erasing the wallet',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: Get.back,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: controller.reset,
                child: const Text('Reset'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
