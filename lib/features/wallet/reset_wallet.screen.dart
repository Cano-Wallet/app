import 'package:example/features/general/centered_placeholder.widget.dart';
import 'package:flutter/material.dart';

class ResetWalletScreen extends StatelessWidget {
  const ResetWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredPlaceholder(
      iconData: Icons.warning,
      message:
          'All your wallet data will be erased permanently. Make sure you have a backup of your seed and passphrase before you proceed with erasing the wallet',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text('Reset'),
          )
        ],
      ),
    );
  }
}
