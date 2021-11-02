import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/core/zenon.manager.dart';
import 'package:app/features/app/routes.dart';
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
    final success = await Utils.deleteDirectory(znnDefaultPaths.main);

    if (!success) {
      return console
          .error('failed to delete directory: ${znnDefaultPaths.main.path}');
    }

    // re-init paths
    await ZenonManager.initPaths();

    console.info('successfully reset!');

    // set default KeyStore
    ZenonManager.setKeyStore(null);

    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
