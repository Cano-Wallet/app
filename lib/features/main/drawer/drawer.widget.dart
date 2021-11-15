import 'package:app/core/utils/globals.dart';
import 'package:app/features/app/routes.dart';
import 'package:app/features/general/dicebear_avatar.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ZDrawer extends StatelessWidget {
  const ZDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _header = DrawerHeader(
      child: Center(
        child: InkWell(
          onTap: () => Get.toNamed(Routes.addresses),
          child: Column(
            children: [
              DiceBearAvatar(
                seed: viewingAddress.toString(),
                size: 70,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(viewingAddress!.toShortString()),
                  const SizedBox(width: 5),
                  const Icon(LineIcons.caretDown, size: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Drawer(
      child: ListView(
        children: [
          _header,
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
