import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ImportWalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImportWalletScreenController());
  }
}

class ImportWalletScreenController extends GetxController {
  //
}
