import 'package:app/features/app/routes.dart';
import 'package:get/get.dart';

class TokensTabController extends GetxController {
  static TokensTabController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void viewList() {
    Get.toNamed(Routes.tokenList);
  }

  void create() {
    //
  }
}
