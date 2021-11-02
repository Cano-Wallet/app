import 'dart:async';

import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PillarsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static PillarsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final result = '0'.obs;

  // GETTERS

  // INIT

  // FUNCTIONS
  Future<void> fetch() async {
    final pillars = await Zenon().embedded.pillar.getAll();
    result.value = '${pillars.count}';

    console.info('done');
  }
}
