import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/features/sentinels/sentinels_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'sentinel_list/sentinel.listview.dart';

class _SentinelsTabState extends State<SentinelsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final SentinelsTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final headers = [
      // TODO: add charts
      ZCard(
        title: 'Collect',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'ZNN',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.circle, color: Colors.green, size: 10)
                  ],
                ),
                Obx(
                  () => Text(
                    controller.znnRewards(),
                    style: Styles.dashboardNumberStyle,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Text(
                      'QSR',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.circle, color: Colors.blue, size: 10)
                  ],
                ),
                Obx(
                  () => Text(
                    controller.qsrRewards(),
                    style: Styles.dashboardNumberStyle,
                  ),
                ),
              ],
            ),
            OutlinedButton(
              style: Styles.outlinedButtonStyle,
              child: const Text('Collect'),
              onPressed: () {
                //
              },
            ),
          ],
        ),
      ),
      const SizedBox(height: 15),
      Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          icon: const Icon(LineIcons.trophy),
          label: const Text('Rewards History'),
          onPressed: () => Get.toNamed(Routes.sentinelRewards),
        ),
      ),
      const SizedBox(height: 15),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: SentinelListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: () => Get.toNamed(Routes.spawnSentinel),
      child: const Icon(LineIcons.plus),
    );

    return Scaffold(
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class SentinelsTab extends StatefulWidget {
  const SentinelsTab({Key? key}) : super(key: key);

  @override
  _SentinelsTabState createState() => _SentinelsTabState();
}
