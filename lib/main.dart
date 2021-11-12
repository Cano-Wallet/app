import 'package:app/features/general/connectivity/connectivity_bar.controller.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/controllers/global.controller.dart';
import 'core/controllers/persistence.controller.dart';
import 'core/managers/hive.manager.dart';
import 'core/managers/zenon.manager.dart';
import 'features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init Zenon Paths
  await ZenonManager.initPaths();
  // init Hive
  HiveManager.init();
  // setup window size for desktop
  _setupWindowSize();

  // Initialize Top Controllers
  Get.put(PersistenceController());
  Get.put(GlobalController());
  Get.put(ConnectivityController());

  // TODO: enable crash reporting
  runApp(const App());
}

void _setupWindowSize() async {
  if (!GetPlatform.isDesktop) return;

  // const size = Size(950, 1400); // desktop size
  const size = Size(400, 900); // phone size
  await DesktopWindow.setWindowSize(size);
  await DesktopWindow.setMinWindowSize(size);
}
