import 'package:example/features/app/routes.dart';
import 'package:get/get.dart';

class StakingTabController extends GetxController {
  static StakingTabController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void viewList() {
    Get.toNamed(Routes.stakingList);
  }

  void stake() {
    //
  }
}
