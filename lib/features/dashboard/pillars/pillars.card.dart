import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'pillars_card.controller.dart';

class PillarsUI extends GetView<PillarsCardController> {
  const PillarsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Pillars'),
      subtitle: Obx(() => Text(controller.result())),
      trailing: IconButton(
        onPressed: controller.fetch,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
