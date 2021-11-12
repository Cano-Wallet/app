import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/features/general/selector.sheet.dart';
import 'package:app/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PillarListViewController extends BaseListController {
  final List<Widget> headers;
  PillarListViewController({this.headers = const []});

  static PillarListViewController get to => Get.find();

  // VARIABLES
  @override
  int get pageSize => 20;

  // PROPERTIES

  // GETTERS

  // INIT
  @override
  void onReady() {
    fetch();
    super.onReady();
  }

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

    final item = ListItemAnimation(
      child: ListTile(
        title: Text(object.name),
        subtitle: Text(object.producerAddress.toString()),
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

  void onTap(PillarInfo object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Delegate',
          leading: const Icon(Icons.connect_without_contact),
          onSelected: () {
            //
          },
        ),
        SelectorItem(
          title: 'Copy',
          leading: const Icon(Icons.content_copy),
          onSelected: () => Utils.copyToClipboard(
            object.producerAddress.toString(),
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
