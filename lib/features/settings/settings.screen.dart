import 'package:app/core/managers/hive.manager.dart';
import 'package:app/features/app/routes.dart';
import 'package:app/features/settings/settings_screen.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SettingsScreen extends GetView<SettingsScreenController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _content = ListView(
      shrinkWrap: true,
      children: [
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.addressBook),
          trailing: const Icon(LineIcons.angleRight),
          title: const Text('Addresses'),
          subtitle: Obx(() => Text(controller.address.value)),
          onTap: () => Get.toNamed(Routes.addresses),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.addressBook),
          trailing: const Icon(LineIcons.angleRight),
          title: const Text('Contacts'),
          subtitle: Text(HiveManager.contacts!.length.toString()),
          onTap: () => Get.toNamed(Routes.contacts),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.list),
          trailing: const Icon(LineIcons.angleRight),
          title: const Text('Peers'),
          onTap: () => Get.toNamed(Routes.peers),
        ),
        // const Divider(),
        // ObxValue(
        //   (RxBool data) => SwitchListTile(
        //     title: const Text('Dark Mode'),
        //     secondary: const Icon(LineIcons.adjust),
        //     value: data.value,
        //     onChanged: controller.onSwitchTheme,
        //   ),
        //   GlobalController.to.darkMode,
        // ),
        // const Divider(),
        // ListTile(
        //   leading: const Icon(LineIcons.font),
        //   trailing: const Icon(LineIcons.angleRight),
        //   title: const Text('Font Settings'),
        //   subtitle: const Text('Font Face & Scale Settings'),
        //   onTap: () {
        //     //
        //   },
        // ),
        // const Divider(),
        // GetBuilder(
        //   init: PersistenceController(),
        //   builder: (final PersistenceController _) => SwitchListTile(
        //     title: const Text('App Security Lock'),
        //     subtitle: const Text('Set a PIN / Biometrics Lock'),
        //     secondary: const Icon(LineIcons.lock),
        //     value: _.appLock.val,
        //     onChanged: controller.onSwitchAppLock,
        //   ),
        // ),
        // const Divider(),
        // ListTile(
        //   leading: const Icon(LineIcons.language),
        //   trailing: const Icon(LineIcons.angleRight),
        //   title: Text(
        //       '${Tr.language.trans()}: ${Tr.languageString.trans()} - ${Tr.localeString.trans()}'),
        //   onTap: () async {
        //     // final locale = await UIUtils.supportedLocales();
        //     // if (locale == null) return;
        //     // PersistenceController.to.localeCode.val = locale.toString();
        //     // PersistenceController.to.update();
        //     // Get.updateLocale(locale);
        //   },
        // ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.lock),
          trailing: const Icon(LineIcons.angleRight),
          title: const Text('Lock Wallet'),
          onTap: () => Get.offAndToNamed(Routes.unlockWallet),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(LineIcons.syncIcon),
          trailing: const Icon(LineIcons.angleRight),
          title: const Text('Reset Wallet'),
          onTap: () => Get.toNamed(Routes.resetWallet),
        ),
        if (kDebugMode) ...[
          const Divider(),
          ListTile(
            title: const Text('Playground'),
            leading: const Icon(LineIcons.play),
            onTap: () => Get.offAndToNamed(Routes.playground),
          ),
        ],
        const Divider(),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: _content,
    );
  }
}
