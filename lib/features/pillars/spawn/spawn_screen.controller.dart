import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';

class SpawnPillarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpawnPillarScreenController());
  }
}

class SpawnPillarScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static SpawnPillarScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
