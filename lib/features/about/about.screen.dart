import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import 'about_screen.controller.dart';

class AboutScreen extends GetView<AboutScreenController> {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _content = ListView(
      shrinkWrap: true,
      children: [
        const ListTile(
          leading: Icon(LineIcons.code),
          title: Text('ZNN Dart SDK version'),
          subtitle: Text(znnSdkVersion),
        ),
        ExpansionTile(
          leading: const Icon(LineIcons.wiredNetwork),
          title: const Text(
            'Node',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              leading: const Icon(LineIcons.server),
              title: const Text('Kernel version'),
              subtitle:
                  Obx(() => Text('${controller.nodeOsInfo()?.kernelVersion}')),
            ),
            ListTile(
              leading: const Icon(LineIcons.desktop),
              title: const Text('Operating System'),
              subtitle: Obx(() => Text('${controller.nodeOsInfo()?.os}')),
            ),
            ListTile(
              leading: const Icon(LineIcons.laptop),
              title: const Text('Platform'),
              subtitle: Obx(
                () => Text(
                    '${controller.nodeOsInfo()?.platform} ${controller.nodeOsInfo()?.platformVersion}'),
              ),
            ),
            ListTile(
              leading: const Icon(LineIcons.microchip),
              title: const Text('Processors'),
              subtitle: Obx(() => Text('${controller.nodeOsInfo()?.numCPU}')),
            ),
            ListTile(
              leading: const Icon(LineIcons.route),
              title: const Text('Go routines'),
              subtitle:
                  Obx(() => Text('${controller.nodeOsInfo()?.numGoroutine}')),
            ),
            ListTile(
              leading: const Icon(LineIcons.memory),
              title: const Text('Memory'),
              subtitle: Obx(() => Text(
                  '${controller.nodeOsInfo()?.memoryFree} / ${controller.nodeOsInfo()?.memoryTotal}')),
            ),
          ],
        ),
        ExpansionTile(
          leading: Icon(
            GetPlatform.isDesktop ? LineIcons.laptop : LineIcons.mobilePhone,
          ),
          title: const Text(
            'Client',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: [
            // for desktop users
            // const ListTile(
            //   leading: Icon(Icons.info),
            //   title: Text('Client hostname'),
            //   subtitle: Text('xx'),
            // ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Operating System'),
              subtitle: Obx(() => Text('${controller.clientOsName}')),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Operating System Version'),
              subtitle: Obx(() => Text('${controller.clientOsVersion}')),
            ),
            // for desktop users
            // const ListTile(
            //   leading: Icon(Icons.info),
            //   title: Text('Processors'),
            //   subtitle: Text('xx'),
            // ),
          ],
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.download),
          title: const Text('Check for updates'),
          subtitle: Obx(() => Text(controller.appVersion)),
          onTap: () {
            // TODO: check for updates
          },
        ),
        const Divider(),
        ExpansionTile(
          leading: const Icon(LineIcons.donate),
          title: const Text(
            'Donation',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              leading: const Icon(LineIcons.peopleCarry),
              trailing: const Icon(LineIcons.copy),
              title: const Text('Community Fund Address'),
              onTap: controller.copyCommunityFundAddress,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(LineIcons.code),
              trailing: const Icon(LineIcons.copy),
              title: const Text('Developer Fund Address'),
              onTap: controller.copyDeveloperFundAddress,
            ),
          ],
        ),
        const Divider(),
        const ExpansionTile(
          leading: Icon(LineIcons.peopleCarry),
          title: Text(
            'Community',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                'Soon...',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: _content,
    );
  }
}
