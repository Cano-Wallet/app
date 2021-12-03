import 'dart:ui';

import 'package:cano/core/managers/zenon.manager.dart';
import 'package:cano/core/utils/console.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/general/connectivity/connectivity_bar.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController
    with ConsoleMixin, StateMixin {
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
    init();

    _initAppLifeCycleEvents();
    super.onInit();
  }

  // FUNCTIONS
  void init() async {
    change(null, status: RxStatus.loading());

    final initialized = await ZenonManager.initClient();

    // show welcome screen if not authenticated
    final authenticated = await ZenonManager.authenticated();

    if (!authenticated) {
      await Get.toNamed(Routes.welcome);
    }

    change(
      null,
      status: initialized
          ? RxStatus.success()
          : RxStatus.error('Failed to initialize'),
    );
  }

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
