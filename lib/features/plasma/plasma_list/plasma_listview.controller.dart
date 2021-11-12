import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/styles.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/features/general/selector.sheet.dart';
import 'package:app/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class PlasmaListViewController extends BaseListController {
  final List<Widget> headers;
  PlasmaListViewController({this.headers = const []});

  static PlasmaListViewController get to => Get.find();

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
            testAddress,
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

    final qsr = Utils.formatCurrency(AmountUtils.addDecimals(
      object.qsrAmount,
      qsrDecimals,
    ));

    final item = ListItemAnimation(
      child: ListTile(
        onTap: () => onTap(object),
        title: Text('$qsr tQSR'),
        subtitle: Text(object.beneficiary.toString()),
        trailing: OutlinedButton(
          style: Styles.outlinedButtonStyle20Red,
          child: const Text('Cancel', style: TextStyle(fontSize: 12)),
          onPressed: () {},
        ),
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

  void onTap(FusionEntry object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Cancel',
          leading: const Icon(Icons.cancel),
          onSelected: () {
            //
          },
        ),
        SelectorItem(
          title: 'Copy',
          leading: const Icon(Icons.content_copy),
          onSelected: () => Utils.copyToClipboard(
            object.beneficiary.toString(),
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
