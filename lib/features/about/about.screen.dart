import 'dart:io';

import 'package:cano/core/utils/globals.dart';
import 'package:cano/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

import 'about_screen.controller.dart';

class AboutScreen extends GetView<AboutScreenController> {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _content = ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 20),
        Image.asset(Images.logo, height: 50),
        const SizedBox(height: 15),
        Obx(
          () => Text(
            '${controller.packageInfo.value?.appName}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17),
          ),
        ),
        const SizedBox(height: 10),
        // TODO: localize
        const Text(
          kProjectDescription,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 30),
        const Divider(),
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
        const Divider(),
        ExpansionTile(
          leading: Icon(
            GetPlatform.isDesktop ? LineIcons.laptop : LineIcons.mobilePhone,
          ),
          title: const Text(
            'Client',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Client hostname'),
              subtitle: Text(Platform.localHostname),
            ),
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
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Processors'),
              subtitle: Text(Platform.numberOfProcessors.toString()),
            ),
          ],
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
              subtitle: Text(communityFundAddress.toString()),
              onTap: controller.copyCommunityFundAddress,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(LineIcons.laptopCode),
              trailing: const Icon(LineIcons.copy),
              title: const Text('Developer Fund Address'),
              subtitle: Text(developerFundAddress.toString()),
              onTap: controller.copyDeveloperFundAddress,
            ),
          ],
        ),
        const Divider(),
        ExpansionTile(
          leading: const Icon(LineIcons.peopleCarry),
          title: const Text(
            'Community',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          children: <Widget>[
            ListTile(
              leading: const Icon(LineIcons.twitter),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon Twitter'),
              subtitle: const Text('@Zenon_Network'),
              onTap: () => launch(kZenonTwitterUrl),
            ),
            ListTile(
              leading: const Icon(LineIcons.medium),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon Medium'),
              subtitle: const Text('@zenon.network'),
              onTap: () => launch(kZenonMediumUrl),
            ),
            ListTile(
              leading: const Icon(LineIcons.telegram),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon Telegram'),
              subtitle: const Text('t.me/zenonnetwork'),
              onTap: () => launch(kZenonTelegramUrl),
            ),
            ListTile(
              leading: const Icon(LineIcons.github),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon GitHub'),
              subtitle: const Text('@zenonnetwork'),
              onTap: () => launch(kZenonGithubUrl),
            ),
            ListTile(
              leading: const Icon(LineIcons.bitcoin),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon Bitcoin Talk'),
              subtitle: const Text('Topic: 5279643'),
              onTap: () => launch(kZenonBitcoinTalkUrl),
            ),
            ListTile(
              leading: const Icon(LineIcons.discord),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon Discord'),
              subtitle: const Text('Zenon'),
              onTap: () => launch(kZenonDiscordUrl),
            ),
            ListTile(
              leading: const Icon(LineIcons.youtube),
              trailing: const Icon(LineIcons.alternateExternalLink),
              title: const Text('Zenon YouTube'),
              subtitle: const Text('Zenon'),
              onTap: () => launch(kZenonYouTubeUrl),
            ),
          ],
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.code),
          trailing: const Icon(LineIcons.alternateExternalLink),
          title: const Text('SDK Version'),
          subtitle: const Text(znnSdkVersion),
          onTap: () => launch(kZenonSDKUrl),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.download),
          trailing: const Icon(LineIcons.alternateExternalLink),
          title: const Text('Check for updates'),
          subtitle: Obx(() => Text(controller.appVersion)),
          onTap: () {
            // TODO: check for updates
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.github),
          trailing: const Icon(LineIcons.alternateExternalLink),
          title: const Text('Open Source Code'),
          subtitle: const Text(kProjectGithubUrl),
          onTap: () => launch(kProjectGithubUrl),
        ),
        const Divider(),
        const SizedBox(height: 20),
        TextButton.icon(
          icon: const Icon(LineIcons.twitter),
          label: const Text('Follow $kDeveloperTwitterHandle'),
          onPressed: () => launch(kDeveloperTwitterUrl),
        ),
        const Text(
          'Developer',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 50),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: _content,
    );
  }
}
