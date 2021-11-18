import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'staking_rewards_listview.controller.dart';

class StakingRewardsListView extends StatelessWidget {
  final List<Widget> headers;

  const StakingRewardsListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StakingRewardsListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
