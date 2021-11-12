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
import 'package:line_icons/line_icons.dart';

import 'main_screen.controller.dart';

class MainScreen extends GetView<MainScreenController> with ConsoleMixin {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _tabs = [
      ZTab(
        title: 'Dashboard',
        tab: Tab(icon: Icon(LineIcons.alternateTachometer)),
        child: DashboardTab(),
      ),
      ZTab(
        title: 'Transfer',
        tab: Tab(icon: Icon(LineIcons.paperPlane)),
        child: TransferTab(),
      ),
      ZTab(
        title: 'Pillars',
        tab: Tab(icon: Icon(LineIcons.hotel)),
        child: PillarsTab(),
      ),
      ZTab(
        title: 'Sentinels',
        tab: Tab(icon: Icon(LineIcons.vihara)),
        child: SentinelsTab(),
      ),
      ZTab(
        title: 'Staking',
        tab: Tab(icon: Icon(LineIcons.donate)),
        child: StakingTab(),
      ),
      ZTab(
        title: 'Plasma',
        tab: Tab(icon: Icon(LineIcons.chargingStation)),
        child: PlasmaTab(),
      ),
      ZTab(
        title: 'Tokens',
        tab: Tab(icon: Icon(LineIcons.coins)),
        child: TokensTab(),
      ),
      ZTab(
        title: 'Incentivized',
        tab: Tab(icon: Icon(LineIcons.award)),
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
              title: Text(
                _tabs[controller.currentTabIndex()].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              bottom: _tabBar,
              actions: [
                IconButton(
                  icon: const Icon(LineIcons.bell),
                  onPressed: () => Get.toNamed(Routes.notifications),
                ),
                IconButton(
                  icon: const Icon(LineIcons.cog),
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

    const _splash = Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

    return Obx(() => controller.ready() ? _content : _splash);
  }
}
