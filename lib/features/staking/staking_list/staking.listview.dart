import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'staking_listview.controller.dart';

class StakingListView extends StatelessWidget {
  final List<Widget> headers;

  const StakingListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StakingListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
