import 'package:app/core/utils/styles.dart';
import 'package:app/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'balance_card.controller.dart';

class BalanceUI extends GetView<BalanceCardController> {
  const BalanceUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Balance',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ],
      ),
    );
  }
}
