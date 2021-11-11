import 'dart:async';

import 'package:app/core/animations/animations.dart';
import 'package:app/core/controllers/base_list.controller.dart';
import 'package:app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class TokenListViewController extends BaseListController {
  final List<Widget> headers;
  TokenListViewController({this.headers = const []});

  static TokenListViewController get to => Get.find();

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

    final item = ListItemAnimation(
      child: ListTile(
        title: Text(object.symbol),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(object.owner.toShortString()),
            Text(Utils.formatKNumber(object.totalSupply)),
            const SizedBox(height: 5),
            Row(
              children: [
                if (object.isMintable) ...[
                  const Icon(LineIcons.wrench, size: 17),
                  const SizedBox(width: 5),
                ],
                if (object.isBurnable) ...[
                  const Icon(LineIcons.fire, size: 17),
                  const SizedBox(width: 5),
                ],
                if (object.isUtility) ...[
                  const Icon(LineIcons.cog, size: 17),
                ]
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
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
}
