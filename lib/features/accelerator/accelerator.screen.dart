import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'accelerator_screen.controller.dart';

class AcceleratorScreen extends GetView<AcceleratorScreenController> {
  const AcceleratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerator'),
      ),
      body: const Center(
        child: Text('Accelerator'),
      ),
    );
  }
}
