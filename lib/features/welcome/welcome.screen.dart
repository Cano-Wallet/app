import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/globals.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class WelcomeScreen extends StatelessWidget with ConsoleMixin {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _info() async {
      final zenon = Zenon();

      final keystores = await zenon.keyStoreManager.listAllKeyStores();
      console.info('walletPath: ${keystores.length}');

      console
          .info('defaultKeyPair: ${zenon.defaultKeyPair?.address.toString()}');
      console.info('defaultKeyStore: ${zenon.defaultKeyStore?.mnemonic}');
      console.info('defaultKeyStorePath: ${zenon.defaultKeyStorePath?.path}');

      console.info(
          'keyStoreInUse: ${zenon.keyStoreManager.keyStoreInUse?.mnemonic}');
      console.info('walletPath: ${zenon.keyStoreManager.walletPath?.path}');
    }

    void _createKeyStore() async {
      final zenon = Zenon();

      const testName = '';

      final file = await zenon.keyStoreManager.createFromMnemonic(
        kTestMnemonic,
        kTestPassword,
        testName,
      );

      console.info('created: ${file.path}');
    }

    void _importFile() async {
      final file = await Utils.pickKeyStoreFile();
      if (file == null) return;
      console.info('file: ${file.path}');

      final zenon = Zenon();
      const testPassword = '1#TestPassword#1';
      final keyStore =
          await zenon.keyStoreManager.readKeyStore(testPassword, file);
      console.info('keyStore: ${keyStore.mnemonic}');
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome'),
            const Text('Select an option to access your wallet'),
            ElevatedButton(
              child: const Text('Create'),
              onPressed: () async {
                Get.toNamed(Routes.createWallet);
              },
            ),
            ElevatedButton(
              child: const Text('Import'),
              onPressed: () {
                Get.toNamed(Routes.importWallet);
              },
            ),
            const ElevatedButton(
              child: Text('Hardware'),
              onPressed: null,
            ),
            ElevatedButton(
              onPressed: _info,
              child: const Text('KeyStore Info'),
            ),
            ElevatedButton(
              onPressed: _createKeyStore,
              child: const Text('Create KeyStore'),
            ),
            ElevatedButton(
              onPressed: _importFile,
              child: const Text('Import File'),
            ),
          ],
        ),
      ),
    );
  }
}
