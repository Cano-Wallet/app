import 'package:example/core/utils/console.dart';
import 'package:example/features/app/routes.dart';
import 'package:example/features/dashboard/dashboard.tab.dart';
import 'package:example/features/general/connectivity/connectivity_bar.widget.dart';
import 'package:example/features/incentivized/incentivized.tab.dart';
import 'package:example/features/pillars/pillars.tab.dart';
import 'package:example/features/plasma/plasma.tab.dart';
import 'package:example/features/sentinels/sentinels.tab.dart';
import 'package:example/features/staking/staking.tab.dart';
import 'package:example/features/tokens/tokens.tab.dart';
import 'package:example/features/transfer/transfer.tab.dart';
import 'package:example/features/welcome/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_screen.controller.dart';

class MainScreen extends GetView<MainScreenController> with ConsoleMixin {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _tabs = [
      MyTab(
        title: 'Dashboard',
        tab: Tab(icon: Icon(Icons.dashboard)),
        child: DashboardTab(),
      ),
      MyTab(
        title: 'Transfer',
        tab: Tab(icon: Icon(Icons.send)),
        child: TransferTab(),
      ),
      MyTab(
        title: 'Pillars',
        tab: Tab(icon: Icon(Icons.apartment)),
        child: PillarsTab(),
      ),
      MyTab(
        title: 'Sentinels',
        tab: Tab(icon: Icon(Icons.circle)),
        child: SentinelsTab(),
      ),
      MyTab(
        title: 'Staking',
        tab: Tab(icon: Icon(Icons.clean_hands)),
        child: StakingTab(),
      ),
      MyTab(
        title: 'Plasma',
        tab: Tab(icon: Icon(Icons.ac_unit)),
        child: PlasmaTab(),
      ),
      MyTab(
        title: 'Tokens',
        tab: Tab(icon: Icon(Icons.adjust)),
        child: TokensTab(),
      ),
      MyTab(
        title: 'Incentivized',
        tab: Tab(icon: Icon(Icons.attach_money)),
        child: IncentivizedTab(),
      ),
    ];

    return DefaultTabController(
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
                onPressed: () => Get.to(() => const WelcomeScreen()),
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
  }
}

class MyTab {
  final String title;
  final Tab tab;
  final Widget child;

  const MyTab({
    required this.title,
    required this.tab,
    required this.child,
  });
}
