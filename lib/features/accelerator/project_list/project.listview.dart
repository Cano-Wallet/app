import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'project_listview.controller.dart';

class ProjectListView extends StatelessWidget {
  final List<Widget> headers;

  const ProjectListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectListViewController(headers: headers));
    return controller.content();
  }
}
