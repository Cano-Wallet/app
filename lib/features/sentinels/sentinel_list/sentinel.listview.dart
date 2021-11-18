import 'package:cano/features/sentinels/sentinel_list/sentinel_listview.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentinelListView extends StatelessWidget {
  final List<Widget> headers;

  const SentinelListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SentinelListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
