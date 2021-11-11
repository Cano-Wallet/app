import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'plasma_listview.controller.dart';

class PlasmaListView extends StatelessWidget {
  final List<Widget> headers;

  const PlasmaListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlasmaListViewController(headers: headers));
    return controller.content();
  }
}
