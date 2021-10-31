import 'package:example/features/app/routes.dart';
import 'package:get/get.dart';

class SettingsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsScreenController());
  }
}

class SettingsScreenController extends GetxController {
  static SettingsScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void addressList() {
    // Get.toNamed(Routes.addressList);
  }

  void peerList() {
    Get.toNamed(Routes.peerList);
  }

  void create() {
    //
  }
}
