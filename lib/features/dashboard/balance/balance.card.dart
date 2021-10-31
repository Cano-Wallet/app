import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'balance_card.controller.dart';

class BalanceUI extends GetWidget<BalanceCardController> {
  const BalanceUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Balance'),
      subtitle: Obx(() => Text(controller.result())),
      trailing: IconButton(
        onPressed: controller.fetch,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
