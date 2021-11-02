import 'package:app/features/tokens/tokens_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _TokensTabState extends State<TokensTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TokensTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    const _content = Center(
      child: Text('Tokens'),
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
              label: const Text('Tokens List'),
              onPressed: controller.viewList,
            ),
          ],
        ),
      ),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.create,
      icon: const Icon(Icons.add),
      label: const Text('Create'),
    );

    return Scaffold(
      bottomNavigationBar: _bottomBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class TokensTab extends StatefulWidget {
  const TokensTab({Key? key}) : super(key: key);

  @override
  _TokensTabState createState() => _TokensTabState();
}
