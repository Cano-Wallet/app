import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'token_listview.controller.dart';

class TokenListView extends StatelessWidget {
  final List<Widget> headers;

  const TokenListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TokenListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
