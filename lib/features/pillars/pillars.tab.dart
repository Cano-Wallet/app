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

    const _content = Center(
      child: Text('Pillars'),
    );

    final _bottomBar = BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Pillar List'),
              onPressed: controller.viewList,
            ),
          ],
        ),
      ),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.spawn,
      icon: const Icon(Icons.add),
      label: const Text('Spawn'),
    );

    return Scaffold(
      bottomNavigationBar: _bottomBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
