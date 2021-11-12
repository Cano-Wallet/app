import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';

class IncentivizedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncentivizedScreenController());
  }
}

class IncentivizedScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static IncentivizedScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
