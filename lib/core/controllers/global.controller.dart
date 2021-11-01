import 'package:example/core/utils/console.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController with ConsoleMixin {
  static GlobalController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final darkMode = true.obs;

  // GETTERS

  // FUNCTIONS
}
