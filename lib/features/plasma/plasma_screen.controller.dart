import 'package:get/get.dart';

class PlasmaScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlasmaScreenController());
  }
}

class PlasmaScreenController extends GetxController {
  static PlasmaScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void fuse() {
    //
  }
}
