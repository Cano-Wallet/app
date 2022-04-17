import 'package:cano/core/utils/console.dart';
import 'package:cano/features/app/routes.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class OthersPlayground extends StatelessWidget with ConsoleMixin {
  const OthersPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Others',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Welcome Screen'),
              onPressed: () => Get.toNamed(Routes.welcome),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Reset Wallet'),
              onPressed: () => Get.toNamed(Routes.resetWallet),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Print Window Size'),
              onPressed: () async {
                final size = await DesktopWindow.getWindowSize();
                console.info('${size.height}');
              },
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Test'),
              onPressed: () async {
                // final signed = Crypto.sign('message'.codeUnits, privateKey, publicKey);

                // const signature =
                //     '1937509e6ebb24092b24f7343bd7444d732780a449835885986e00c7f05cfa2d1ec1603078d332dcd9b774aed733e30251ad029fef18bf6a0035895cfdbc4b0e';
                // const message = '';

                // final verified = Crypto.verify(
                //     signature.codeUnits, message.codeUnits, publicKey);

                // Crypto.getPublicKey(privateKey);
              },
            ),
          ],
        ),
      ),
    );
  }
}
