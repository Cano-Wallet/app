import 'package:app/features/pillars/pillar_list/pillar_listview.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PillarListView extends StatelessWidget {
  final List<Widget> headers;

  const PillarListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PillarListViewController(headers: headers));
    return controller.content();
  }
}
