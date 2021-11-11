import 'package:app/core/utils/styles.dart';
import 'package:app/features/general/z_card.widget.dart';
import 'package:app/features/pillars/pillars_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pillar_list/pillar.listview.dart';

class _PillarsTabState extends State<PillarsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final PillarsTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final headers = [
      ZCard(
        title: 'Rewards',
        child: Container(),
      ),
      ZCard(
        title: 'Collect',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                '${controller.znnRewards()} tZNN',
                style: Styles.dashboardNumberStyle,
              ),
            ),
            OutlinedButton(
              style: Styles.outlinedButtonStyle20,
              onPressed: () {
                //
              },
              child: const Text('Collect'),
            ),
          ],
        ),
      ),
      // spacer
      const SizedBox(height: 10),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: PillarListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.spawn,
      icon: const Icon(Icons.add),
      label: const Text('Spawn'),
    );

    return Scaffold(
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class PillarsTab extends StatefulWidget {
  const PillarsTab({Key? key}) : super(key: key);

  @override
  _PillarsTabState createState() => _PillarsTabState();
}
