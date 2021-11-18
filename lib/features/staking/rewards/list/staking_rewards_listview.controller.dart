import 'dart:async';

import 'package:cano/core/animations/animations.dart';
import 'package:cano/core/controllers/base_list.controller.dart';
import 'package:cano/core/utils/extensions.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/utils.dart';
import 'package:cano/features/general/selector.sheet.dart';
import 'package:cano/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:supercharged/supercharged.dart';

class StakingRewardsListViewController extends BaseListController {
  final List<Widget> headers;
  StakingRewardsListViewController({this.headers = const []});

  static StakingRewardsListViewController get to => Get.find();

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

    RewardHistoryList? object;

    try {
      object = await Zenon().embedded.stake.getFrontierRewardByPage(
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
    final object = data[index] as RewardHistoryEntry;

    final qsr = Utils.formatCurrency(AmountUtils.addDecimals(
      object.qsrAmount,
      qsrDecimals,
    ));

    final item = ListItemAnimation(
      child: ListTile(
        onTap: () => onTap(object),
        title: Text('$qsr tQSR'),
        trailing: Text(object.epoch.toString()),
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

  void onTap(RewardHistoryEntry object) {
    SelectorSheet(
      items: [
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
