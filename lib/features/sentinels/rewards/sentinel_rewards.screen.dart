import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list/sentinel_rewards.listview.dart';
import 'sentinel_rewards_screen.controller.dart';

class SentinelRewardsScreen extends GetView<SentinelRewardsScreenController> {
  const SentinelRewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _content = Padding(
      padding: EdgeInsets.all(15),
      child: SentinelRewardsListView(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Sentinel Rewards')),
      body: _content,
    );
  }
}
