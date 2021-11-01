import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/globals.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/core/zenon.manager.dart';
import 'package:example/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class WelcomeScreen extends StatelessWidget with ConsoleMixin {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome'),
            const Text('Select an option to access your wallet'),
            const Divider(),
            ElevatedButton(
              child: const Text('Create'),
              onPressed: () async {
                Get.toNamed(Routes.createWallet);
              },
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Import'),
              onPressed: () {
                Get.toNamed(Routes.importWallet);
              },
            ),
            const Divider(),
            const ElevatedButton(
              child: Text('Hardware'),
              onPressed: null,
            ),
            const Divider(),
            const Text('Debugging area...'),
            const Divider(),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.playground),
              child: const Text('Playground'),
            ),
          ],
        ),
      ),
    );
  }
}
