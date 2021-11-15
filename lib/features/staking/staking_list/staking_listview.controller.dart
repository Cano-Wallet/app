import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/extensions.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/features/general/selector.sheet.dart';
import 'package:app/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:supercharged/supercharged.dart';

class StakingListViewController extends BaseListController {
  final List<Widget> headers;
  StakingListViewController({this.headers = const []});

  static StakingListViewController get to => Get.find();

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

    StakeList? object;

    try {
      object = await Zenon().embedded.stake.getEntriesByAddress(
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
    final object = data[index] as StakeEntry;

    final znn = Utils.formatCurrency(AmountUtils.addDecimals(
      object.amount,
      znnDecimals,
    ));

    final startDate =
        DateTime.fromMillisecondsSinceEpoch(object.startTimestamp * 1000);
    final expDate =
        DateTime.fromMillisecondsSinceEpoch(object.expirationTimestamp * 1000);

    final dates = startDate.until(expDate);

    final item = ListItemAnimation(
      child: ListTile(
        onTap: () => onTap(object),
        title: Text('$znn tZNN'),
        subtitle: Text(object.address.toString()),
        trailing: Column(
          children: [
            Text('${dates.length} days'),
            // const Text('81:23:30', style: TextStyle(fontSize: 12)),
          ],
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

  void onTap(StakeEntry object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Copy',
          leading: const Icon(LineIcons.copy),
          onSelected: () => Utils.copyToClipboard(
            object.address.toString(),
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
