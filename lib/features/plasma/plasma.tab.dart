import 'package:example/features/plasma/plasma_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _PlasmaTabState extends State<PlasmaTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final PlasmaTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    const _content = Center(
      child: Text('Plasma'),
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
              label: const Text('Plasma List'),
              onPressed: controller.viewList,
            ),
          ],
        ),
      ),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.fuse,
      icon: const Icon(Icons.add),
      label: const Text('Fuse'),
    );

    return Scaffold(
      bottomNavigationBar: _bottomBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class PlasmaTab extends StatefulWidget {
  const PlasmaTab({Key? key}) : super(key: key);

  @override
  _PlasmaTabState createState() => _PlasmaTabState();
}
