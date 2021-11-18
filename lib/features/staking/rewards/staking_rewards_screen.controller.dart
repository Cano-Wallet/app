import 'package:get/get.dart';

class StakingRewardsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StakingRewardsScreenController());
  }
}

class StakingRewardsScreenController extends GetxController {
  static StakingRewardsScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void create() {
    //
  }
}
