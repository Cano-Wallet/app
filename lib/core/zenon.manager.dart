import 'dart:io';

import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

final zenon = Zenon();

class ZenonManager {
  static final console = Console(name: 'ZenonManager');

  static KeyStore? keyStore;
  static KeyPair? get keyPair => keyStore?.getKeyPair(0);
  static Future<Address?> get address async => await keyPair?.address;

  static void init() async {
    await initPaths();

    // zenon.wsClient
    //     .addOnConnectionEstablishedCallback((allResponseBroadcaster) async {
    //   await allResponseBroadcaster.forEach((e) {
    //     console.warning('broadcaster: $e');
    //   });
    // });

    final initialized = await zenon.wsClient.initialize(
      'ws://$kTestPeerHost:$kTestPeerPort', // TODO: select the peer address from persistence
      retry: false,
    );

    console.info('initialized: $initialized');
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
}
