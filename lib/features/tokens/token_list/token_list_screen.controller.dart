import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class TokenListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TokenListScreenController());
  }
}

class TokenListScreenController extends BaseListController {
  static TokenListScreenController get to => Get.find();

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

    TokenList? object;

    try {
      object = await Zenon().embedded.token.getAll(
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
    final object = data[index] as Token;

    return ListItemAnimation(
      child: ListTile(
        title: Text('Name: ${object.name}, ${object.symbol}'),
      ),
    );
  }
}
