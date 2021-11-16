import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';

class SpawnSentinelScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpawnSentinelScreenController());
  }
}

class SpawnSentinelScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static SpawnSentinelScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
