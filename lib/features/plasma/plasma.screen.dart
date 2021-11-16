import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/features/plasma/plasma_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'plasma_list/plasma.listview.dart';

class PlasmaScreen extends GetView<PlasmaScreenController> {
  const PlasmaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headers = [
      ZCard(
        title: 'Plasma Stats',
        child: Container(),
      ),
      // spacer
      const SizedBox(height: 10),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: PlasmaListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: controller.fuse,
      child: const Icon(LineIcons.chargingStation),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plasma'),
      ),
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}
