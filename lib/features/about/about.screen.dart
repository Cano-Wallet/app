import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import 'about_screen.controller.dart';

class AboutScreen extends GetView<AboutScreenController> {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _content = ListView(
      shrinkWrap: true,
      children: const [
        ListTile(
          leading: Icon(Icons.info),
          title: Text('ZNN SDK version'),
          subtitle: Text(znnSdkVersion),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('ZNN Node build version'),
          subtitle: Text('xx'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('ZNN Node git commit hash'),
          subtitle: Text('xx'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Client hostname'),
          subtitle: Text('xx'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Client operating system'),
          subtitle: Text('xx'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Client operating system version'),
          subtitle: Text('xx'),
        ),
        Divider(),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: _content,
    );
  }
}
