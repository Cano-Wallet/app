import 'package:example/core/controllers/global.controller.dart';
import 'package:example/core/controllers/persistence.controller.dart';
import 'package:example/core/translations/constants.dart';
import 'package:example/core/utils/globals.dart';
import 'package:example/features/settings/settings_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsScreenController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _content = ListView(
      shrinkWrap: true,
      children: [
        const Divider(),
        ListTile(
          leading: const Icon(Icons.list),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('Addresses'),
          subtitle: const Text(kTestAddress),
          onTap: controller.addressList,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.list),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('Peers'),
          onTap: controller.peerList,
        ),
        const Divider(),
        ObxValue(
          (RxBool data) => SwitchListTile(
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.ac_unit),
            value: data.value,
            onChanged: controller.onSwitchTheme,
          ),
          GlobalController.to.darkMode,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.font_download_outlined),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('Font Settings'),
          subtitle: const Text('Font Face & Scale Settings'),
          onTap: () {
            //
          },
        ),
        const Divider(),
        GetBuilder(
          init: PersistenceController(),
          builder: (final PersistenceController _) => SwitchListTile(
            title: const Text('App Security Lock'),
            subtitle: const Text('Set a PIN / Biometrics Lock'),
            secondary: const Icon(Icons.lock),
            value: _.appLock.val,
            onChanged: controller.onSwitchAppLock,
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.translate),
          trailing: const Icon(Icons.navigate_next),
          title: Text(
              '${Tr.language.trans()}: ${Tr.languageString.trans()} - ${Tr.localeString.trans()}'),
          onTap: () async {
            // final locale = await UIUtils.supportedLocales();
            // if (locale == null) return;
            // PersistenceController.to.localeCode.val = locale.toString();
            // PersistenceController.to.update();
            // Get.updateLocale(locale);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('About'),
          onTap: controller.onAboutTapped,
          onLongPress: () {
            //
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('Update'),
          onTap: controller.onAboutTapped,
          onLongPress: () {
            //
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('Donation'),
          onTap: controller.onAboutTapped,
          onLongPress: () {
            //
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info),
          trailing: const Icon(Icons.navigate_next),
          title: const Text('Community'),
          onTap: controller.onAboutTapped,
          onLongPress: () {
            //
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: _content,
    );
  }
}
