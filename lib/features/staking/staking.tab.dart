import 'package:example/features/staking/staking_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _StakingTabState extends State<StakingTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final StakingTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    const _content = Center(
      child: Text('Staking'),
    );

    final _bottomBar = BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Staking List'),
              onPressed: controller.viewList,
            ),
          ],
        ),
      ),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.stake,
      icon: const Icon(Icons.add),
      label: const Text('Stake'),
    );

    return Scaffold(
      bottomNavigationBar: _bottomBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
