import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class AboutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutScreenController());
  }
}

class AboutScreenController extends GetxController with ConsoleMixin {
  static AboutScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES

  // GETTERS

  // INIT
  @override
  void onReady() {
    fetch();
    super.onReady();
  }

  // FUNCTIONS
  void fetch() async {
    final zenon = Zenon();

    final osInfo = await zenon.stats.osInfo();
    console.info(osInfo.toString());
  }
}
