import 'package:cano/features/staking/rewards/list/staking_rewards.listview.dart';
import 'package:cano/features/staking/rewards/staking_rewards_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StakingRewardsScreen extends GetView<StakingRewardsScreenController> {
  const StakingRewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _content = Padding(
      padding: EdgeInsets.all(15),
      child: StakingRewardsListView(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Staking Rewards')),
      body: _content,
    );
  }
}
