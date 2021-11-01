import 'dart:async';

import 'package:example/core/animations/animations.dart';
import 'package:example/core/controllers/base_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PeerListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PeerListScreenController());
  }
}

class PeerListScreenController extends BaseListController {
  static PeerListScreenController get to => Get.find();

  // VARIABLES
  @override
  int get pageSize => 20;

  // PROPERTIES

  // GETTERS

  // INIT

  // FUNCTIONS

  @override
  Future<void> fetch({bool loadMore = false}) async {
    change(null, status: RxStatus.loading());

    NetworkInfo? object;

    try {
      object = await Zenon().stats.networkInfo();
    } catch (e) {
      return onException(loadMore, e);
    }

    data.assignAll(object.peers!);

    // empty / success state
    change(
      null,
      status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }

  @override
  Widget itemBuilder(context, index) {
    final object = data[index] as PeerInfo;

    return ListItemAnimation(
      child: ListTile(
        title: Text(object.name!),
        subtitle: Text(object.address!),
      ),
    );
  }
}
