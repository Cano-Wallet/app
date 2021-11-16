import 'package:cano/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class AcceleratorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcceleratorScreenController());
  }
}

class AcceleratorScreenController extends GetxController
    with ConsoleMixin, StateMixin {
  static AcceleratorScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  void fetch() async {
    final zenon = Zenon();
    zenon.embedded.accelerator.getAll();
  }

  void create() {
    //
  }
}
