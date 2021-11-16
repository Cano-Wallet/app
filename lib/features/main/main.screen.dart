import 'package:cano/core/utils/console.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:cano/core/managers/zenon.manager.dart';
import 'package:cano/features/app/routes.dart';
import 'package:cano/features/dashboard/dashboard.tab.dart';
import 'package:cano/features/general/busy_indicator.widget.dart';
import 'package:cano/features/general/centered_placeholder.widget.dart';
import 'package:cano/features/general/connectivity/connectivity_bar.widget.dart';
import 'package:cano/features/general/z_tab.widget.dart';
import 'package:cano/features/main/drawer/drawer.widget.dart';
import 'package:cano/features/pillars/pillars.tab.dart';
import 'package:cano/features/sentinels/sentinels.tab.dart';
import 'package:cano/features/staking/staking.tab.dart';
import 'package:cano/features/transfer/transfer.tab.dart';
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
        child: DashboardTab(),
        tab: Tab(
          text: 'Dashboard',
          icon: Icon(LineIcons.alternateTachometer),
        ),
      ),
      ZTab(
        child: TransferTab(),
        tab: Tab(
          text: 'Transfer',
          icon: Icon(LineIcons.paperPlane),
        ),
      ),
      ZTab(
        child: PillarsTab(),
        tab: Tab(
          text: 'Pillars',
          icon: Icon(LineIcons.hotel),
        ),
      ),
      ZTab(
        child: SentinelsTab(),
        tab: Tab(
          text: 'Sentinels',
          icon: Icon(LineIcons.vihara),
        ),
      ),
      ZTab(
        child: StakingTab(),
        tab: Tab(
          text: 'Staking',
          icon: Icon(LineIcons.donate),
        ),
      ),
    ];

    final _actions = [
      IconButton(
        icon: const Icon(LineIcons.bell),
        onPressed: () => Get.toNamed(Routes.notifications),
      ),
    ];

    final _appBar = AppBar(
      centerTitle: false,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: ConnectivityBar(),
      ),
      actions: _actions,
      title: Obx(
        () => Text(
          _tabs[controller.currentTabIndex()].tab.text!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );

    final _content = DefaultTabController(
      length: _tabs.length,
      child: Builder(builder: (context) {
        controller.lastTabIndex.value = DefaultTabController.of(context)!.index;

        final _tabBar = TabBar(
          tabs: _tabs.take(5).map((e) => e.tab).toList(),
          isScrollable: false,
          labelStyle: const TextStyle(fontSize: 12),
          onTap: controller.onTabTapped,
        );

        return Scaffold(
          appBar: _appBar,
          bottomNavigationBar: _tabBar,
          drawer: const ZDrawer(),
          body: TabBarView(
            children: _tabs.map((e) => e.child).toList(),
            physics: const BouncingScrollPhysics(),
          ),
        );
      }),
    );

    Widget _error(String? message) {
      return Material(
        child: CenteredPlaceholder(
          iconData: Icons.error,
          message: message!,
          child: OutlinedButton(
            child: const Text('Try again'),
            style: Styles.outlinedButtonStyle20,
            onPressed: () => ZenonManager.initClient(),
          ),
        ),
      );
    }

    return controller.obx(
      (_) => _content,
      onLoading: const Material(child: BusyIndicator()),
      onError: _error,
    );
  }
}
