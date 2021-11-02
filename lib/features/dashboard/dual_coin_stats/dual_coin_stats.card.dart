import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'dual_coin_stats_card.controller.dart';

class DualCoinStatsUI extends GetView<DualCoinStatsCardController> {
  const DualCoinStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Dual Coin Stats'),
      subtitle: Obx(() => Text(controller.result())),
      trailing: IconButton(
        onPressed: controller.fetch,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
