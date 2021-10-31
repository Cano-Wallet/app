import 'package:example/features/sentinels/sentinel_list/sentinel_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentinelListScreen extends GetView<SentinelListScreenController> {
  const SentinelListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sentinel List')),
      body: controller.content(),
    );
  }
}
