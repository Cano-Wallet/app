import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'delegation_stats_card.controller.dart';

class DelegationStatsUI extends GetView<DelegationStatsCardController> {
  const DelegationStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Delegation Stats',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              controller.name(),
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Obx(
            () => Text(
              '${controller.weight()} tZNN',
              style: Styles.dashboardNumberStyle,
            ),
          ),
        ],
      ),
    );
  }
}
