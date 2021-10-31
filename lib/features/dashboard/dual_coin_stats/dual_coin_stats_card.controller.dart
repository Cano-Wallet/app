import 'dart:async';

import 'package:example/core/utils/console.dart';
import 'package:get/get.dart';

class DualCoinStatsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static DualCoinStatsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final result = 'tZNN: 0, tQSR: 0'.obs;

  // GETTERS

  // INIT

  // FUNCTIONS
  Future<void> fetch() async {
    //
  }
}
