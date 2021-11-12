import 'dart:math';

import 'package:app/core/managers/hive.manager.dart';
import 'package:app/core/models/hive/address.hive.dart';
import 'package:app/core/utils/console.dart';
import 'package:get/get.dart';

class ContactsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsScreenController());
  }
}

class ContactsScreenController extends GetxController
    with StateMixin, ConsoleMixin {
  static ContactsScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final data = <HiveAddress>[].obs;

  // GETTERS

  // INIT
  @override
  void onInit() {
    data.value = HiveManager.contacts!.values.toList();

    // empty / success state
    change(
      null,
      status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );

    super.onInit();
  }

  // FUNCTIONS

  void add() async {
    final random = Random().nextDouble();

    final object = HiveAddress(
      id: 'address_$random',
      label: 'Label $random',
    );

    await HiveManager.contacts!.add(object);
    data.add(object);
  }
}
