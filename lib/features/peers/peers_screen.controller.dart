import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/extensions.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/features/general/selector.sheet.dart';
import 'package:app/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PeersScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PeersScreenController());
  }
}

class PeersScreenController extends BaseListController {
  static PeersScreenController get to => Get.find();

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

    data.assignAll(object.peers);

    // empty / success state
    change(
      null,
      status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }

  @override
  Widget itemBuilder(context, index) {
    final object = data[index] as Peer;

    return ListItemAnimation(
      child: ListTile(
        onTap: () => onTap(object),
        title: Text(object.ip),
        subtitle: Text(object.publicKey),
      ),
    );
  }

  void onTap(Peer object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Copy',
          leading: const Icon(LineIcons.copy),
          onSelected: () => Utils.copyToClipboard(object.ip.toString()),
        ),
        SelectorItem(
          title: 'Details',
          leading: const Icon(LineIcons.laptopCode),
          onSelected: () {
            Get.to(() => JSONViewerScreen(data: object.toJson()));
          },
        ),
      ],
    ).show();
  }
}