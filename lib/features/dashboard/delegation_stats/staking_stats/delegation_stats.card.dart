import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'delegation_stats_card.controller.dart';

class DelegationStatsUI extends GetView<DelegationStatsCardController> {
  const DelegationStatsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Delegation Stats'),
      subtitle: Obx(() => Text(controller.result())),
      trailing: IconButton(
        onPressed: controller.fetch,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
