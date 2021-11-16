import 'package:cano/core/utils/console.dart';
import 'package:cano/features/app/routes.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                //
              },
            ),
          ],
        ),
      ),
    );
  }
}
