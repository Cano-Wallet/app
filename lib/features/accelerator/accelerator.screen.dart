import 'package:app/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:line_icons/line_icons.dart';

import 'accelerator_screen.controller.dart';
import 'project_list/project.listview.dart';

class AcceleratorScreen extends GetView<AcceleratorScreenController> {
  const AcceleratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headers = [
      ZCard(
        title: 'Projects',
        child: Container(),
      ),
      // spacer
      const SizedBox(height: 10),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: ProjectListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: controller.create,
      child: const Icon(LineIcons.plus),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerator'),
      ),
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}
