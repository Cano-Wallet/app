import 'dart:async';

import 'package:cano/core/animations/animations.dart';
import 'package:cano/core/controllers/base_list.controller.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/general/selector.sheet.dart';
import 'package:cano/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
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
            viewingAddress!,
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
        title: Text('$qsr QSR'),
        subtitle: Text(object.beneficiary.toString()),
        trailing: OutlinedButton(
          style: Styles.outlinedButtonStyleNegative,
          child: const Text('Cancel'),
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
          leading: const Icon(LineIcons.times),
          onSelected: () {
            //
          },
        ),
        SelectorItem(
          title: 'Copy',
          leading: const Icon(LineIcons.copy),
          onSelected: () => Utils.copyToClipboard(
            object.beneficiary.toString(),
          ),
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
