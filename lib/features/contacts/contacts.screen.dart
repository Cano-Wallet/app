import 'package:cano/core/animations/animations.dart';
import 'package:cano/core/utils/console.dart';
import 'package:cano/features/general/centered_placeholder.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'contacts_screen.controller.dart';

class ContactsScreen extends GetView<ContactsScreenController>
    with ConsoleMixin {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget itemBuilder(BuildContext context, int index) {
      final object = controller.data[index];

      return ListItemAnimation(
        child: ListTile(
          title: Text(object.label),
          subtitle: Text(object.id),
        ),
      );
    }

    final _content = controller.obx(
      (_) => Obx(
        () => ListView.separated(
          shrinkWrap: true,
          itemCount: controller.data.length,
          itemBuilder: itemBuilder,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      onEmpty: const CenteredPlaceholder(
        iconData: Icons.list_alt_outlined,
        message: 'empty',
      ),
    );

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: controller.add,
      child: const Icon(LineIcons.plus),
    );

    final _appBar = AppBar(
      title: Obx(() => Text('${controller.data.length} Contacts')),
      actions: [
        IconButton(
          onPressed: () {
            // TODO: show context menu with clear all
          },
          icon: const Icon(LineIcons.verticalEllipsis),
        ),
      ],
    );

    return Scaffold(
      appBar: _appBar,
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}
