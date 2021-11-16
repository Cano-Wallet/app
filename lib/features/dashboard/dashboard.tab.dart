import 'package:cano/features/dashboard/delegation_stats/staking_stats/delegation_stats.card.dart';
import 'package:cano/features/dashboard/sentinels/sentinels.card.dart';
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
        padding: const EdgeInsets.all(15),
        children: const [
          DualCoinStatsUI(),
          SizedBox(height: 5),
          BalanceUI(),
          SizedBox(height: 5),
          PillarsUI(),
          SizedBox(height: 5),
          SentinelsUI(),
          SizedBox(height: 5),
          StakingStatsUI(),
          SizedBox(height: 5),
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
