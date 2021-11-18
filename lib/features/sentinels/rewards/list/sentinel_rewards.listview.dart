import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sentinel_rewards_listview.controller.dart';

class SentinelRewardsListView extends StatelessWidget {
  final List<Widget> headers;

  const SentinelRewardsListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SentinelRewardsListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
