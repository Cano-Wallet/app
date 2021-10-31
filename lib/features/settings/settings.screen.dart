import 'package:example/features/settings/settings_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsScreenController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _content = Center(
      child: Text('Settings'),
    );

    final _bottomBar = BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Addresses'),
              onPressed: controller.addressList,
            ),
            TextButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Peers'),
              onPressed: controller.peerList,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      bottomNavigationBar: _bottomBar,
      body: _content,
    );
  }
}
