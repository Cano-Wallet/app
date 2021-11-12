import 'package:app/core/animations/animations.dart';
import 'package:app/core/managers/hive.manager.dart';
import 'package:app/core/utils/console.dart';
import 'package:app/features/general/centered_placeholder.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'addresses_screen.controller.dart';

class AddressesScreen extends GetView<AddressesScreenController>
    with ConsoleMixin {
  const AddressesScreen({Key? key}) : super(key: key);

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
      (_) => ListView.separated(
        shrinkWrap: true,
        itemCount: HiveManager.addresses!.length,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => const Divider(),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}
