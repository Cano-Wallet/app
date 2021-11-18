import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list/pillar_rewards.listview.dart';
import 'pillar_rewards_screen.controller.dart';

class PillarRewardsScreen extends GetView<PillarRewardsScreenController> {
  const PillarRewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _content = Padding(
      padding: EdgeInsets.all(15),
      child: PillarRewardsListView(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Pillar Rewards')),
      body: _content,
    );
  }
}
