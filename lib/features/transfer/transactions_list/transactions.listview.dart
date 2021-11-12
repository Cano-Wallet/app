import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'transactions_listview.controller.dart';

class TransactionsListView extends StatelessWidget {
  final List<Widget> headers;

  const TransactionsListView({
    Key? key,
    this.headers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionsListViewController(
      headers: headers,
    ));

    return controller.content();
  }
}
