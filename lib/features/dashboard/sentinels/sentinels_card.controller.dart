import 'dart:async';

import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class SentinelsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static SentinelsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final result = '0'.obs;

  // GETTERS

  // INIT

  // FUNCTIONS
  Future<void> fetch() async {
    final sentinels = await Zenon().embedded.sentinel.getAllActive();
    result.value = '${sentinels.count}';
    console.info('done');
  }
}
