import 'dart:async';

import 'package:cano/core/animations/animations.dart';
import 'package:cano/core/controllers/base_list.controller.dart';
import 'package:cano/core/controllers/persistence.controller.dart';
import 'package:cano/core/utils/extensions.dart';
import 'package:cano/core/utils/ui_utils.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/general/selector.sheet.dart';
import 'package:cano/features/json_viewer/json_viewer.screen.dart';
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

    // add the known peers

    data.insert(
      0,
      Peer.fromJson({
        'ip': 'peers.zenon.wiki',
        'publicKey': 'Community Node',
      }),
    );

    data.insert(
      0,
      Peer.fromJson({
        'ip': 'peers.znn.space',
        'publicKey': 'Official Node',
      }),
    );

    // empty / success state
    change(
      null,
      status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }

  @override
  Widget itemBuilder(context, index) {
    final object = data[index] as Peer;

    if (object.ip.contains('157.245.159.233')) console.info(object.ip);

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
          title: 'Set as Node',
          leading: const Icon(LineIcons.wiredNetwork),
          onSelected: () {
            PersistenceController.to.nodeAddress.val = '${object.ip}:35998';
            // TODO: localize
            UIUtils.showSnackBar(
              title: 'Node Address Set',
              message: 'App restart is required to propagate changes',
              icon: const Icon(LineIcons.copy),
              seconds: 4,
            );
          },
        ),
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
