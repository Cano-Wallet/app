import 'package:app/core/utils/console.dart';
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
  final nodeAddress = 'peers.znn.space'.val('node address');

  // GENERAL
  final lastBuildNumber = 0.val('last build number');
  final currentId = ''.val('current id');
  final localeCode = 'en'.val('locale code');
  final mainTabInitialIndex = 0.val('main tab initial index');
  final followDialogShown = false.val('follow dialog shown');
  final locationInfoJson = ''.val('location info json');
  final simulateRefreshSession = false.val('simulate refresh session');
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
  // PRO
  final pro = false.val('pro');

  // BACKGROUND NOTIFICATIONS
  final bgNotifications = true.val('bg notifications');
  final bgMessageNotifications = true.val('bg message notifications');
  final bgMessageNotificationsUnread = 0.val('bg message notifications unread');
  final bgFBNotifications = true.val('bg fb notifications');
  final bgFBNotificationsUnread = 0.val('bg fb notifications unread');
  final bgFriendNotifications = true.val('bg friend status notifications');

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
