import 'package:desktop_window/desktop_window.dart';
import 'package:example/features/general/connectivity/connectivity_bar.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/zenon.manager.dart';
import 'features/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // init Zenon SDK
  ZenonManager.init();
  // setup window size for desktop
  _setupWindowSize();

  // Initialize Top Controllers
  Get.lazyPut(() => ConnectivityController());

  // TODO: enable crash reporting
  runApp(const App());
}

void _setupWindowSize() async {
  if (GetPlatform.isDesktop) {
    const size = Size(950, 1400);
    await DesktopWindow.setWindowSize(size);
    await DesktopWindow.setMinWindowSize(size);
  }
}
