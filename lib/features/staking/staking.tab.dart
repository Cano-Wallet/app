import 'package:app/core/utils/styles.dart';
import 'package:app/features/general/z_card.widget.dart';
import 'package:app/features/staking/staking_tab.controller.dart';
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
            Obx(
              () => Text(
                '${controller.qsrRewards()} tQSR',
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
      child: StakingListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: controller.stake,
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
