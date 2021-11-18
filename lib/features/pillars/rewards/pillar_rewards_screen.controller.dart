import 'package:get/get.dart';

class PillarRewardsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PillarRewardsScreenController());
  }
}

class PillarRewardsScreenController extends GetxController {
  static PillarRewardsScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void create() {
    //
  }
}
