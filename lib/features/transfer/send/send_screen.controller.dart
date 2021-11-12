import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';

class SendScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendScreenController());
  }
}

class SendScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static SendScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
