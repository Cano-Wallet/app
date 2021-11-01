import 'package:example/core/controllers/persistence.controller.dart';
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
  final PersistenceController persistence = Get.find();

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

  void onSwitchTheme(final bool isDark) async {
    persistence.darkMode.val = isDark;
    persistence.update();

    // global.darkMode.value = isDark;
    // global.updateTheme();

    Get.back();
  }

  void onSwitchAppLock(bool enabled) {
    //
  }

  void onAboutTapped() => Get.toNamed(Routes.about);
}
