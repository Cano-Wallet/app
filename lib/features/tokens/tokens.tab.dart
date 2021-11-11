import 'package:app/features/general/z_card.widget.dart';
import 'package:app/features/tokens/tokens_tab.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'token_list/token.listview.dart';

class _TokensTabState extends State<TokensTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TokensTabController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final headers = [
      ZCard(
        title: 'Balance',
        child: Container(),
      ),
      // spacer
      const SizedBox(height: 10),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: TokenListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: controller.create,
      icon: const Icon(Icons.add),
      label: const Text('Create'),
    );

    return Scaffold(
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
