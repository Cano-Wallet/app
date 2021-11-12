import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';

class StakeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StakeScreenController());
  }
}

class StakeScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static StakeScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
