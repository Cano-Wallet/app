import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResetWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetWalletScreenController());
  }
}

class ResetWalletScreenController extends GetxController with ConsoleMixin {
  static ResetWalletScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
