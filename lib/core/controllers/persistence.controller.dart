import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../translations/data.dart';

class PersistenceController extends GetxController with ConsoleMixin {
  static PersistenceController get to => Get.find();

  // BOX
  final box = GetStorage();

  // TEMPORARY
  final viewingAddress = ''.val('viewing address');

  // ZENON
  final nodeAddress = 'peers.zenon.network:443'.val('node address');

  // GENERAL
  final lastBuildNumber = 0.val('last build number');
  final currentId = ''.val('current id');
  final localeCode = 'en'.val('locale code');
  // FONT
  final fontName = 'Roboto'.val('font name');
  final fontScaleFactor = 1.0.val('font scale factor');
  // THEME
  final darkMode = true.val('dark mode');
  // ANIMATIONS
  final scrollAnimations = false.val('scroll animations');
  // WALLPAPER
  final wallpaperPath = ''.val('wallpaper path');
  // APP LOCK
  final appLock = false.val('app lock');
  final appLockCode = ''.val('app lock code');
  final maxUnlockAttempts = 5.val('max unlock attempts');
  // PRO
  final pro = false.val('pro');

  // BACKGROUND NOTIFICATIONS
  final bgNotifications = true.val('bg notifications');

  // GETTERS

  @override
  void onInit() {
    _initLocale();
    super.onInit();
  }

  void _initLocale() {
    final isSystemLocaleSupported =
        translationKeys[Get.deviceLocale?.languageCode ?? 'en'] != null;
    final defaultLocaleCode =
        isSystemLocaleSupported ? Get.deviceLocale?.languageCode : 'en';

    box.writeIfNull('locale code', defaultLocaleCode);
  }
}
