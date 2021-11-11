import 'package:app/features/pillars/pillar_list/pillars_list.screen.dart';
import 'package:app/features/pillars/pillars_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _PillarsTabState extends State<PillarsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final PillarsTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    const _content = Padding(
      padding: EdgeInsets.all(15),
      child: PillarListScreen(),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.spawn,
      icon: const Icon(Icons.add),
      label: const Text('Spawn'),
    );

    return Scaffold(
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class PillarsTab extends StatefulWidget {
  const PillarsTab({Key? key}) : super(key: key);

  @override
  _PillarsTabState createState() => _PillarsTabState();
}
