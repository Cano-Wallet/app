import 'package:app/core/utils/globals.dart';
import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ZDrawer extends StatelessWidget {
  const ZDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(testAddress.toString()),
          ),
          ListTile(
            title: const Text('Plasma'),
            leading: const Icon(LineIcons.chargingStation),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.plasma);
            },
          ),
          ListTile(
            title: const Text('Tokens'),
            leading: const Icon(LineIcons.coins),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.tokens);
            },
          ),
          ListTile(
            title: const Text('Incentivized'),
            leading: const Icon(LineIcons.award),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.incentivized);
            },
          ),
          ListTile(
            title: const Text('Accelerator'),
            leading: const Icon(LineIcons.dollarSign),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.accelerator);
            },
          ),
          ListTile(
            title: const Text('Playground'),
            leading: const Icon(LineIcons.play),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.playground);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(LineIcons.cog),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.settings);
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(LineIcons.infoCircle),
            onTap: () {
              Get.back(); // close drawer 1st
              Get.toNamed(Routes.about);
            },
          ),
        ],
      ),
    );
  }
}
