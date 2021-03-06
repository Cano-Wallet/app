import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'sentinels_card.controller.dart';

class SentinelsUI extends GetView<SentinelsCardController> {
  const SentinelsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Sentinels',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Active Sentinels',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Obx(
                () => Text(
                  controller.count.toString(),
                  style: Styles.dashboardNumberStyle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Image.asset(Images.sentinel, width: 40),
        ],
      ),
    );
  }
}
