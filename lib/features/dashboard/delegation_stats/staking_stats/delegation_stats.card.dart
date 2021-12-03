import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'delegation_stats_card.controller.dart';

class DelegationStatsUI extends GetView<DelegationStatsCardController> {
  const DelegationStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Delegation Stats',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                  '${controller.weight()} ZNN',
                  style: Styles.dashboardNumberStyle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Image.asset(Images.delegation, width: 40),
        ],
      ),
    );
  }
}
