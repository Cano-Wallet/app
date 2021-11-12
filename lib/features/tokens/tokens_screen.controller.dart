import 'package:get/get.dart';

class TokensScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TokensScreenController());
  }
}

class TokensScreenController extends GetxController {
  static TokensScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void create() {
    //
  }
}
