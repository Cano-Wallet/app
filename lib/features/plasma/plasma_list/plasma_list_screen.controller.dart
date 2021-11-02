import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PlasmaListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlasmaListScreenController());
  }
}

class PlasmaListScreenController extends BaseListController {
  static PlasmaListScreenController get to => Get.find();

  // VARIABLES
  @override
  int get pageSize => 20;

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  @override
  Future<void> fetch({bool loadMore = false}) async {
    preFetch(loadMore);

    FusionEntryList? object;

    try {
      object = await Zenon().embedded.plasma.getEntriesByAddress(
            Address.parse(kTestAddress),
            pageIndex: pageIndex,
            pageSize: pageSize,
          );
    } catch (e) {
      return onException(loadMore, e);
    }

    postFetch(loadMore, object);
  }

  @override
  Widget itemBuilder(context, index) {
    final object = data[index] as FusionEntry;
    final qsr = AmountUtils.addDecimals(object.qsrAmount, qsrDecimals);

    return ListItemAnimation(
      child: ListTile(
        title: Text('tQSR $qsr'),
        subtitle: Text(object.beneficiary.toString()),
      ),
    );
  }
}
