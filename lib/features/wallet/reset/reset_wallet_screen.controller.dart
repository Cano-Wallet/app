import 'package:cano/core/controllers/persistence.controller.dart';
import 'package:cano/core/managers/hive.manager.dart';
import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/core/managers/zenon.manager.dart';
import 'package:cano/features/app/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class ResetWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetWalletScreenController());
  }
}

class ResetWalletScreenController extends GetxController with ConsoleMixin {
  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void reset() async {
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
