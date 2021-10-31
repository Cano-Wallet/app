import 'package:get/get.dart';

class NotificationsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsScreenController());
  }
}

class NotificationsScreenController extends GetxController {
  static NotificationsScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS
}
