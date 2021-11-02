import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class SentinelListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SentinelListScreenController());
  }
}

class SentinelListScreenController extends BaseListController {
  static SentinelListScreenController get to => Get.find();

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

    SentinelInfoList? object;

    try {
      object = await Zenon().embedded.sentinel.getAllActive(
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
    final object = data[index] as SentinelInfo;

    return ListItemAnimation(
      child: ListTile(title: Text(object.stakeAddress.toString())),
    );
  }
}
