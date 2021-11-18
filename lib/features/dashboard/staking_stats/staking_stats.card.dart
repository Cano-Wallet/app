import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'staking_stats_card.controller.dart';

class StakingStatsUI extends GetView<StakingStatsCardController> {
  const StakingStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Staking Stats',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Entries',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Obx(
                () => Text(
                  controller.entriesCount(),
                  style: Styles.dashboardNumberStyle,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Total Amount',
                style: TextStyle(color: Colors.grey),
              ),
              Obx(
                () => Text(
                  '${controller.entriesTotalAmount()} tZNN',
                  style: Styles.dashboardNumberStyle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Image.asset(Images.staking, width: 40),
        ],
      ),
    );
  }
}
