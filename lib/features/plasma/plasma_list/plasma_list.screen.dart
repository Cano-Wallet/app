import 'package:example/features/plasma/plasma_list/plasma_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlasmaListScreen extends GetView<PlasmaListScreenController> {
  const PlasmaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plasma List')),
      body: controller.content(),
    );
  }
}
