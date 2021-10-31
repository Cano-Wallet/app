import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notifications_screen.controller.dart';

class NotificationsScreen extends GetView<NotificationsScreenController> {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _content = Center(
      child: Text('Notifications'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: _content,
    );
  }
}
