import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'sentinels_card.controller.dart';

class SentinelsUI extends GetView<SentinelsCardController> {
  const SentinelsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Active Sentinels'),
      subtitle: Obx(() => Text(controller.result())),
      trailing: IconButton(
        onPressed: controller.fetch,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
