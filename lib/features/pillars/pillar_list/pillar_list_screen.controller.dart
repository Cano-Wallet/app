import 'dart:async';

import 'package:example/core/animations/animations.dart';
import 'package:example/core/base_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PillarListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PillarListScreenController());
  }
}

class PillarListScreenController extends BaseListController {
  static PillarListScreenController get to => Get.find();

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

    PillarInfoList? object;

    try {
      object = await Zenon().embedded.pillar.getAll(
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
    final object = data[index] as PillarInfo;

    return ListItemAnimation(
        child: ListTile(
      title: Text(object.name),
      subtitle: Text(object.producerAddress.toString()),
    ));
  }
}
