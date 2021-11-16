import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';

class PlaygroundScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaygroundScreenController());
  }
}

class PlaygroundScreenController extends GetxController with ConsoleMixin {
  //
}
