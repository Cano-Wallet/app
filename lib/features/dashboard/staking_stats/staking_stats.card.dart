import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'staking_stats_card.controller.dart';

class StakingStatsUI extends GetWidget<StakingStatsCardController> {
  const StakingStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Staking Stats'),
      subtitle: Obx(() => Text(controller.result())),
      trailing: IconButton(
        onPressed: controller.fetch,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
