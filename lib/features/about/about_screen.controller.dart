import 'package:get/get.dart';

class AboutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutScreenController());
  }
}

class AboutScreenController extends GetxController {
  static AboutScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
