import 'package:cano/core/managers/hive.manager.dart';
import 'package:cano/core/models/hive/address.hive.dart';
import 'package:get/get.dart';

class AddressesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressesScreenController());
  }
}

class AddressesScreenController extends GetxController with StateMixin {
  static AddressesScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final data = <HiveAddress>[].obs;

  // GETTERS

  // INIT
  @override
  void onInit() {
    data.value = HiveManager.addresses!.values.toList();

    // empty / success state
    change(
      null,
      status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );

    super.onInit();
  }

  // FUNCTIONS

  void add() {
    //
  }
}
