import 'package:app/features/general/z_card.widget.dart';
import 'package:app/features/plasma/plasma_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'plasma_list/plasma.listview.dart';

class _PlasmaTabState extends State<PlasmaTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final PlasmaTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

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

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.fuse,
      icon: const Icon(Icons.add),
      label: const Text('Fuse'),
    );

    return Scaffold(
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class PlasmaTab extends StatefulWidget {
  const PlasmaTab({Key? key}) : super(key: key);

  @override
  _PlasmaTabState createState() => _PlasmaTabState();
}
