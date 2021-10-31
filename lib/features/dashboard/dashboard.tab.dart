import 'package:example/features/dashboard/delegation_stats/staking_stats/delegation_stats.card.dart';
import 'package:example/features/dashboard/sentinels/sentinels.card.dart';
import 'package:flutter/material.dart';

import 'balance/balance.card.dart';
import 'dual_coin_stats/dual_coin_stats.card.dart';
import 'pillars/pillars.card.dart';
import 'staking_stats/staking_stats.card.dart';

class _DashboardTabState extends State<DashboardTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListView(
        children: const [
          DualCoinStatsUI(),
          BalanceUI(),
          PillarsUI(),
          StakingStatsUI(),
          SentinelsUI(),
          DelegationStatsUI(),
        ],
      ),
    );
  }
}

class DashboardTab extends StatefulWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  _DashboardTabState createState() => _DashboardTabState();
}