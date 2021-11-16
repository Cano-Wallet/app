import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'dual_coin_stats_card.controller.dart';

class DualCoinStatsUI extends GetView<DualCoinStatsCardController> {
  const DualCoinStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Dual Coin Stats',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'tZNN',
            style: TextStyle(color: Colors.grey),
          ),
          Obx(
            () => Text(
              controller.znn(),
              style: Styles.dashboardNumberStyle,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'tQSR',
            style: TextStyle(color: Colors.grey),
          ),
          Obx(
            () => Text(
              controller.qsr(),
              style: Styles.dashboardNumberStyle,
            ),
          ),
        ],
      ),
    );
  }
}
