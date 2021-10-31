import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'busy_indicator.widget.dart';

class SmartRefresherFooter extends StatelessWidget {
  const SmartRefresherFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassicFooter(
      loadingText: '',
      loadingIcon: BusyIndicator(
        size: 15,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class SmartRefresherHeader extends StatelessWidget {
  const SmartRefresherHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassicHeader(
      completeIcon: null,
      completeText: '',
      refreshingText: '',
      refreshingIcon: BusyIndicator(
        size: 15,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
