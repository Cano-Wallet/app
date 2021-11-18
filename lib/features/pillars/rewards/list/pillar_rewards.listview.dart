import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pillar_rewards_listview.controller.dart';

class PillarRewardsListView extends StatelessWidget {
  final List<Widget> headers;

  const PillarRewardsListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PillarRewardsListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
