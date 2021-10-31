import 'package:example/features/staking/staking_list/staking_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StakingListScreen extends GetView<StakingListScreenController> {
  const StakingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staking List')),
      body: controller.content(),
    );
  }
}
