import 'package:app/core/utils/styles.dart';
import 'package:app/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'pillars_card.controller.dart';

class PillarsUI extends GetView<PillarsCardController> {
  const PillarsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZCard(
      title: 'Active Pillars',
      child: Obx(
        () => Text(
          controller.count.toString(),
          style: Styles.dashboardNumberStyle,
        ),
      ),
    );
  }
}
