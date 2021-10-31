import 'dart:io';

import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/globals.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ZenonManager {
  static final console = Console(name: 'ZenonManager');

  static void init() async {
    await _addMobileSupportForZenonSDK();

    final zenon = Zenon();

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

  // Zenon's Dart SDK currently doesn't fully support Android & iOS, so we add it
  // This requires a modified SDK as well that changed directory specific for Android & iOS
  static Future<void> _addMobileSupportForZenonSDK() async {
    final appDir = await getApplicationSupportDirectory();

    // create the directories if unexisting
    final mainDir = Directory(path.join(appDir.path, znnRootDirectory));
    await mainDir.create();

    final walletDir = Directory(path.join(mainDir.path, 'wallet'));
    await walletDir.create();

    final cacheDir = Directory(path.join(mainDir.path, 'syrius'));
    await cacheDir.create();

    znnDefaultPaths = ZnnPaths(
      main: mainDir,
      wallet: walletDir,
      cache: cacheDir,
    );

    console.info('main: ${znnDefaultPaths.main.path}');
    console.info('cache: ${znnDefaultPaths.cache.path}');
    console.info('wallet: ${znnDefaultPaths.wallet.path}');
  }
}
