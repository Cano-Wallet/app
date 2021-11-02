import 'package:app/features/app/routes.dart';
import 'package:get/get.dart';

class SentinelsTabController extends GetxController {
  static SentinelsTabController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void viewList() {
    Get.toNamed(Routes.sentinelList);
  }

  void spawn() {
    //
  }
}
