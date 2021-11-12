import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/features/general/selector.sheet.dart';
import 'package:app/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class SentinelListViewController extends BaseListController {
  final List<Widget> headers;
  SentinelListViewController({this.headers = const []});

  static SentinelListViewController get to => Get.find();

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

    final item = ListItemAnimation(
      child: ListTile(
        title: Text(object.owner.toString()),
        onTap: () => onTap(object),
      ),
    );

    if (index > 0) return item;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...headers,
        item,
      ],
    );
  }

  void onTap(SentinelInfo object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Copy',
          leading: const Icon(Icons.content_copy),
          onSelected: () => Utils.copyToClipboard(
            object.owner.toString(),
          ),
        ),
        SelectorItem(
          title: 'Details',
          leading: const Icon(Icons.details),
          onSelected: () {
            Get.to(() => JSONViewerScreen(data: object.toJson()));
          },
        ),
      ],
    ).show();
  }
}
