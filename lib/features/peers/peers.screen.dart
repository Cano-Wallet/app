import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'peers_screen.controller.dart';

class PeersScreen extends GetView<PeersScreenController> {
  const PeersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peers')),
      body: controller.content(),
    );
  }
}
