import 'dart:io';

import 'package:cano/core/controllers/persistence.controller.dart';
import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/app/routes.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import '../utils/globals.dart';
import 'hive.manager.dart';

class ZenonManager {
  static final zenon = Zenon();
  static final console = Console(name: 'ZenonManager');

  static KeyStore? keyStore;
  static KeyPair? get keyPair => keyStore?.getKeyPair(0);
  static Future<Address?> get address async => await keyPair?.address;

  static Future<bool> initClient() async {
    final wsAddress = 'ws://${PersistenceController.to.nodeAddress.val}';
    // const wsAddress = 'ws://localhost:35998';
    final initialized = await zenon.wsClient.initialize(
      wsAddress,
      retry: false,
    );

    console.info('Node: $wsAddress, initialized: $initialized');
    return initialized;
  }

  // set the current key store
  static void setKeyStore(KeyStore? _keyStore) => keyStore = _keyStore;

  // initialize our app's custom path
  static Future<void> initPaths() async {
    znnDefaultPaths = await defaultPaths();

    console.info('main: ${znnDefaultPaths.main.path}');
    console.info('cache: ${znnDefaultPaths.cache.path}');
    console.info('wallet: ${znnDefaultPaths.wallet.path}');
  }

  static Future<ZnnPaths> defaultPaths() async {
    final packageInfo = await PackageInfo.fromPlatform();
    // we change the root directory to prevent collision with Syrius app directories
    final rootDirectory = packageInfo.appName;

    late Directory main;

    if (Platform.isLinux) {
      main = Directory(path.join(
        Platform.environment['HOME']!,
        '.$rootDirectory',
      ));
    } else if (Platform.isMacOS) {
      main = Directory(path.join(
        Platform.environment['HOME']!,
        'Library',
        rootDirectory,
      ));
    } else if (Platform.isWindows) {
      main = Directory(path.join(
        Platform.environment['AppData']!,
        rootDirectory,
      ));
    } else if (Platform.isAndroid || Platform.isIOS) {
      // add support for mobile
      main = await getApplicationSupportDirectory();
    } else {
      main = Directory(path.join(
        Platform.environment['HOME']!,
        rootDirectory,
      ));
    }

    return ZnnPaths(
      main: main..createSync(),
      wallet: Directory(path.join(main.path, 'wallet'))..createSync(),
      cache: Directory(path.join(main.path, 'cache'))..createSync(),
    );
  }

  static Future<bool> authenticated() async {
    if (viewingAddress != null) return true;

    if ((await keyStoreFiles()).isEmpty) return false;
    await Get.toNamed(Routes.unlockWallet);
    return true;
  }

  static Future<List<File>> keyStoreFiles() async {
    try {
      return await Zenon().keyStoreManager.listAllKeyStores();
    } catch (e) {
      console.error(e.toString());
      return [];
    }
  }

  static void reset() async {
    // delete directories
    final success = await Utils.deleteDirectory(znnDefaultPaths.main);

    if (!success) {
      return console
          .error('failed to delete directory: ${znnDefaultPaths.main.path}');
    }

    // re-init directories
    await ZenonManager.initPaths();

    // unset default KeyStore
    ZenonManager.setKeyStore(null);

    // Erase data
    PersistenceController.to.box.erase();
    HiveManager.reset();

    // temporary
    viewingAddress = null;
    console.info('successfully reset!');
    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
