import 'package:app/features/settings/peer_list/peer_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeerListScreen extends GetView<PeerListScreenController> {
  const PeerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peer List')),
      body: controller.content(),
    );
  }
}
