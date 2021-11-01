import 'package:example/core/utils/console.dart';
import 'package:example/features/main/main.screen.dart';
import 'package:example/features/playground/playground_screen.controller.dart';
import 'package:example/features/playground/wallet/wallet_playground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/api_playground.dart';

class PlaygroundScreen extends GetView<PlaygroundScreenController>
    with ConsoleMixin {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      const MyTab(
        title: 'Wallet',
        tab: Tab(text: 'Wallet'),
        child: WalletPlayground(),
      ),
      const MyTab(
        title: 'API',
        tab: Tab(text: 'API'),
        child: APIPlayground(),
      ),
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Builder(builder: (context) {
        final tabChildren = _tabs.map((e) => e.child).toList();

        final _tabBar = TabBar(
          tabs: _tabs.map((e) => e.tab).toList(),
          isScrollable: false,
          indicatorWeight: 3.0,
        );

        return Scaffold(
          appBar: AppBar(
            bottom: _tabBar,
            title: const Text(
              "Zenon Playground",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: TabBarView(
            children: tabChildren,
            physics: const BouncingScrollPhysics(),
          ),
        );
      }),
    );
  }
}
