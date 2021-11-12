import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:app/features/general/selector.sheet.dart';
import 'package:app/features/json_viewer/json_viewer.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class TransactionsListViewController extends BaseListController {
  final List<Widget> headers;
  TransactionsListViewController({this.headers = const []});

  static TransactionsListViewController get to => Get.find();

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

    AccountBlockList? object;

    try {
      object = await Zenon().ledger.getBlocksByPage(
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
    final object = data[index] as AccountBlock;

    AccountBlock block = object;
    Widget? icon;

    // SENT
    if (object.blockType == BlockTypeEnum.userSend.index) {
      icon = const Icon(
        Icons.arrow_upward,
        color: Colors.redAccent,
      );
    }
    // RECEIVED
    else if (object.blockType == BlockTypeEnum.userReceive.index) {
      block = object.pairedAccountBlock!;

      icon = const Icon(
        Icons.arrow_downward,
        color: Colors.green,
      );
    }

    final sender = block.address;
    final recipient = block.toAddress;

    final tokens = Utils.formatCurrency(AmountUtils.addDecimals(
      block.amount,
      block.token!.decimals,
    ));

    final date = DateTime.fromMillisecondsSinceEpoch(
        block.confirmationDetail!.momentumTimestamp * 1000);

    final item = ListItemAnimation(
      child: ListTile(
        onTap: () => onTap(object),
        leading: icon,
        trailing: Text(Utils.timeAgo(date)),
        title: Text('$tokens ${block.token?.symbol}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('→  ${sender.toShortString()}'),
            Text('←  ${recipient.toShortString()}'),
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

  void onTap(AccountBlock object) {
    SelectorSheet(
      items: [
        SelectorItem(
          title: 'Copy',
          leading: const Icon(Icons.content_copy),
          onSelected: () {
            // show what to copy
          },
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
