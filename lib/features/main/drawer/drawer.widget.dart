import 'package:cano/core/utils/globals.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/general/dicebear_avatar.widget.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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

    final items = [
      _header,
      ListTile(
        title: const Text('Plasma'),
        leading: const Icon(LineIcons.chargingStation),
        onTap: () => Get.offAndToNamed(Routes.plasma),
      ),
      ListTile(
        title: const Text('Tokens'),
        leading: const Icon(LineIcons.coins),
        onTap: () => Get.offAndToNamed(Routes.tokens),
      ),
      ListTile(
        title: const Text('Incentivized'),
        leading: const Icon(LineIcons.award),
        onTap: () => Get.offAndToNamed(Routes.incentivized),
      ),
      ListTile(
        title: const Text('Accelerator Z'),
        leading: const Icon(LineIcons.dollarSign),
        onTap: () => Get.offAndToNamed(Routes.accelerator),
      ),
      ListTile(
        title: const Text('Settings'),
        leading: const Icon(LineIcons.cog),
        onTap: () => Get.offAndToNamed(Routes.settings),
      ),
      ListTile(
        title: const Text('About'),
        leading: const Icon(LineIcons.infoCircle),
        onTap: () => Get.offAndToNamed(Routes.about),
      ),
    ];

    final darkTheme = FlexColorScheme.dark(
      scheme: FlexScheme.jungle,
    ).toTheme.copyWith(canvasColor: Colors.grey.shade900);

    final lightTheme = FlexColorScheme.light(
      scheme: FlexScheme.jungle,
    ).toTheme;

    return Theme(
      data: Get.isDarkMode ? darkTheme : lightTheme,
      child: Drawer(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return items[index];
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: items.length,
        ),
      ),
    );
  }
}
