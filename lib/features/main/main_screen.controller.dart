import 'dart:ui';

import 'package:app/core/utils/console.dart';
import 'package:app/features/general/connectivity/connectivity_bar.controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController with ConsoleMixin {
  static MainScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final ready = false.obs;
  final lastTabIndex = 0.obs;
  final currentTabIndex = 0.obs;
  final updateAvailable = false.obs;

  // GETTERS

  // INIT
  @override
  void onInit() {
    _initAppLifeCycleEvents();
    super.onInit();
  }

  // FUNCTIONS

  void _initAppLifeCycleEvents() {
    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg == AppLifecycleState.resumed.toString()) {
        ConnectivityController.to.init();
      } else if (msg == AppLifecycleState.inactive.toString()) {
        ConnectivityController.to.cancel();
      }

      return Future.value(msg);
    });
  }

  void onTabTapped(index) {
    currentTabIndex.value = index;
    // final sameIndex = lastTabIndex.value == index;

    // if (index == 0) {
    //   // if (sameIndex)
    //   //   FeedScreenController.newsfeed.scrollToTop();
    //   // else
    //   //   ad.initIds(screen: 'feed');
    // } else if (index == 1) {
    //   // if (sameIndex)
    //   //   StoriesTabController.to.scrollToTop();
    //   // else
    //   //   ad.initIds(screen: 'stories');
    // }
  }
}
