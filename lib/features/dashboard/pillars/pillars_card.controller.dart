import 'dart:async';

import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PillarsCardController extends GetxController
    with ConsoleMixin, StateMixin {
  static PillarsCardController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final count = '...'.obs;

  // GETTERS

  // INIT
  @override
  void onReady() {
    fetch();
    super.onReady();
  }

  // FUNCTIONS
  Future<void> fetch() async {
    final pillars = await Zenon().embedded.pillar.getAll();
    count.value = pillars.count.toString();

    console.info('done');
  }
}
