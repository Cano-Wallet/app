import 'package:app/core/controllers/persistence.controller.dart';
import 'package:app/core/utils/console.dart';
import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class SettingsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsScreenController());
  }
}

class SettingsScreenController extends GetxController with ConsoleMixin {
  static SettingsScreenController get to => Get.find();

  // VARIABLES
  final PersistenceController persistence = Get.find();

  // PROPERTIES
  final address = ''.obs;

  // GETTERS

  // INIT

  @override
  void onInit() async {
    final _address = await Zenon().defaultKeyPair?.address;
    address.value = _address != null ? _address.toString() : 'No address';
    console.info('address: ${address.value}');
    super.onInit();
  }

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

    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);

    Get.back();
  }

  void onSwitchAppLock(bool enabled) {
    //
  }

  void onAboutTapped() => Get.toNamed(Routes.about);
}
