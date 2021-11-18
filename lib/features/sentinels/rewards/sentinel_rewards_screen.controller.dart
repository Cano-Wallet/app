import 'package:get/get.dart';

class SentinelRewardsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SentinelRewardsScreenController());
  }
}

class SentinelRewardsScreenController extends GetxController {
  static SentinelRewardsScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void create() {
    //
  }
}
