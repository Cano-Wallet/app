import 'package:cano/features/incentivized/incentivized_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class IncentivizedScreen extends GetView<IncentivizedScreenController> {
  const IncentivizedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incentivized'),
      ),
      body: const Center(
        child: Text('Incentivized'),
      ),
    );
  }
}
