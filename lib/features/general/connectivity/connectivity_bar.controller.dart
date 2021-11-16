import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController with ConsoleMixin {
  static ConnectivityController get to => Get.find();

  // VARIABLES
  StreamSubscription<ConnectivityResult>? connectivitySubscription;

  // PROPERTIES
  final connected = true.obs;

  // GETTERS

  // INIT
  @override
  void onInit() {
    init();
    super.onInit();
  }

  // FUNCTIONS

  void init() async {
    final connectivity = Connectivity();

    connected.value =
        await connectivity.checkConnectivity() != ConnectivityResult.none;
    console.info('connected: ${connected.value}');

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      connected.value = result != ConnectivityResult.none;
      console.info('connected: ${connected()}');
    });

    console.info('init');
  }

  void cancel() {
    console.info('cancelConnectivityStream');
    connectivitySubscription?.cancel();
  }
}
