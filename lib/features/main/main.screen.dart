import 'package:app/core/utils/console.dart';
import 'package:app/features/app/routes.dart';
import 'package:app/features/dashboard/dashboard.tab.dart';
import 'package:app/features/general/connectivity/connectivity_bar.widget.dart';
import 'package:app/features/general/z_tab.widget.dart';
import 'package:app/features/incentivized/incentivized.tab.dart';
import 'package:app/features/pillars/pillars.tab.dart';
import 'package:app/features/plasma/plasma.tab.dart';
import 'package:app/features/sentinels/sentinels.tab.dart';
import 'package:app/features/staking/staking.tab.dart';
import 'package:app/features/tokens/tokens.tab.dart';
import 'package:app/features/transfer/transfer.tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_screen.controller.dart';

class MainScreen extends GetView<MainScreenController> with ConsoleMixin {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _tabs = [
      ZTab(
        title: 'Dashboard',
        tab: Tab(icon: Icon(Icons.dashboard)),
        child: DashboardTab(),
      ),
      ZTab(
        title: 'Transfer',
        tab: Tab(icon: Icon(Icons.send)),
        child: TransferTab(),
      ),
      ZTab(
        title: 'Pillars',
        tab: Tab(icon: Icon(Icons.apartment)),
        child: PillarsTab(),
      ),
      ZTab(
        title: 'Sentinels',
        tab: Tab(icon: Icon(Icons.circle)),
        child: SentinelsTab(),
      ),
      ZTab(
        title: 'Staking',
        tab: Tab(icon: Icon(Icons.clean_hands)),
        child: StakingTab(),
      ),
      ZTab(
        title: 'Plasma',
        tab: Tab(icon: Icon(Icons.ac_unit)),
        child: PlasmaTab(),
      ),
      ZTab(
        title: 'Tokens',
        tab: Tab(icon: Icon(Icons.adjust)),
        child: TokensTab(),
      ),
      ZTab(
        title: 'Incentivized',
        tab: Tab(icon: Icon(Icons.attach_money)),
        child: IncentivizedTab(),
      ),
    ];

    final _content = DefaultTabController(
      length: _tabs.length,
      child: Builder(builder: (context) {
        controller.lastTabIndex.value = DefaultTabController.of(context)!.index;

        final tabChildren = _tabs.map((e) => e.child).toList();

        final _tabBar = TabBar(
          tabs: _tabs.map((e) => e.tab).toList(),
          isScrollable: false,
          indicatorWeight: 3.0,
          onTap: controller.onTabTapped,
        );

        return Obx(
          () => Scaffold(
            bottomNavigationBar: const ConnectivityBar(),
            appBar: AppBar(
              centerTitle: false,
              title: Text(_tabs[controller.currentTabIndex()].title),
              bottom: _tabBar,
              leading: IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => Get.toNamed(Routes.playground),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () => Get.toNamed(Routes.notifications),
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => Get.toNamed(Routes.settings),
                ),
              ],
            ),
            body: TabBarView(
              children: tabChildren,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        );
      }),
    );

    final _splash = Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text('Initializing...'),
          ],
        ),
      ),
    );

    return Obx(() => controller.ready() ? _content : _splash);
  }
}
