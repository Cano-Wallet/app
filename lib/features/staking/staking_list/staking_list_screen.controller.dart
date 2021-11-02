import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class StakingListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StakingListScreenController());
  }
}

class StakingListScreenController extends BaseListController {
  static StakingListScreenController get to => Get.find();

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

    StakeList? object;

    try {
      object = await Zenon().embedded.stake.getEntriesByAddress(
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
    final object = data[index] as StakeEntry;
    final znn = AmountUtils.addDecimals(object.amount, znnDecimals);

    return ListItemAnimation(
      child: ListTile(
        title: Text('$znn tZNN'),
        subtitle: Text(object.address.toString()),
      ),
    );
  }
}
