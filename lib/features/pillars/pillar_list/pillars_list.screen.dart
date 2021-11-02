import 'package:app/features/pillars/pillar_list/pillar_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PillarListScreen extends GetView<PillarListScreenController> {
  const PillarListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pillar List')),
      body: controller.content(),
    );
  }
}
