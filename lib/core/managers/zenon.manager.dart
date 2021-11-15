import 'dart:io';

import 'package:app/core/controllers/persistence.controller.dart';
import 'package:app/core/utils/console.dart';
import 'package:app/features/app/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import '../utils/globals.dart';

class ZenonManager {
  static final zenon = Zenon();
  static final console = Console(name: 'ZenonManager');

  static KeyStore? keyStore;
  static KeyPair? get keyPair => keyStore?.getKeyPair(0);
  static Future<Address?> get address async => await keyPair?.address;

  static Future<bool> initClient() async {
    // TODO: select the peer address from persistence
    return await zenon.wsClient.initialize(
      'ws://$kTestPeerHost:$kTestPeerPort',
      retry: false,
    );
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

    // Since KeyStore is not yet supported on mobile
    // we temporarily use persistence to determine if user has authenticated into the app
    if (GetPlatform.isDesktop) {
      if ((await keyStoreFiles()).isEmpty) return false;
      await Get.toNamed(Routes.unlockWallet);
      return true;
    } else if (GetPlatform.isMobile) {
      // TODO: scrap this when mobile support is out
      final savedViewingAddress = PersistenceController.to.viewingAddress.val;
      console.warning('savedViewingAddress: $savedViewingAddress');

      if (savedViewingAddress.isEmpty ||
          !Address.isValid(savedViewingAddress)) {
        return false;
      }

      // set current viewing address
      viewingAddress = Address.parse(savedViewingAddress);
      return true;
    } else {
      console.error('unsupported platform');
      return false;
    }
  }

  static Future<List<File>> keyStoreFiles() async {
    try {
      return await Zenon().keyStoreManager.listAllKeyStores();
    } catch (e) {
      console.error(e.toString());
      return [];
    }
  }
}