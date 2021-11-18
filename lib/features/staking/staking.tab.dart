import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/features/staking/staking_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'staking_list/staking.listview.dart';

class _StakingTabState extends State<StakingTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final StakingTabController controller = Get.find();

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
                      'tQSR',
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
              style: Styles.outlinedButtonStyle20,
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
          onPressed: () => Get.toNamed(Routes.stakingRewards),
        ),
      ),
      const SizedBox(height: 15),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: StakingListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: () => Get.toNamed(Routes.stake),
      child: const Icon(LineIcons.paperHand),
    );

    return Scaffold(
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class StakingTab extends StatefulWidget {
  const StakingTab({Key? key}) : super(key: key);

  @override
  _StakingTabState createState() => _StakingTabState();
}
