import 'package:example/core/utils/console.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/core/zenon.manager.dart';
import 'package:example/features/app/routes.dart';
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
    // delete syrius files
    await Utils.resetDirectory(znnDefaultPaths.cache);
    // delete wallet files
    await Utils.resetDirectory(znnDefaultPaths.wallet);
    console.info('successfully reset!');

    ZenonManager.keyStore = null;

    Get.offNamedUntil(Routes.main, (route) => false);
  }
}
