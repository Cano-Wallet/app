import 'package:flutter/material.dart';

class _IncentivizedTabState extends State<IncentivizedTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const Scaffold(
      body: Center(
        child: Text('Incentivized'),
      ),
    );
  }
}

class IncentivizedTab extends StatefulWidget {
  const IncentivizedTab({Key? key}) : super(key: key);

  @override
  _IncentivizedTabState createState() => _IncentivizedTabState();
}
