import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';

class AcceleratorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcceleratorScreenController());
  }
}

class AcceleratorScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static AcceleratorScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
