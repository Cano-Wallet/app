import 'package:cano/features/general/z_card.widget.dart';
import 'package:cano/features/tokens/tokens_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'token_list/token.listview.dart';

class TokensScreen extends GetView<TokensScreenController> {
  const TokensScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    final _floatingActionButton = FloatingActionButton(
      heroTag: null,
      onPressed: controller.create,
      child: const Icon(LineIcons.plus),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokens'),
      ),
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}
