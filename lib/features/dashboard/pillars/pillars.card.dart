import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'pillars_card.controller.dart';

class PillarsUI extends GetView<PillarsCardController> {
  const PillarsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Pillars',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Active Pillars',
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
          Image.asset(Images.pillar, width: 40),
        ],
      ),
    );
  }
}
