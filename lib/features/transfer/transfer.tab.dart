import 'package:app/features/general/z_card.widget.dart';
import 'package:flutter/material.dart';

import 'transactions_list/transactions.listview.dart';

class _TransferTabState extends State<TransferTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final headers = [
      ZCard(
        title: 'Rewards',
        child: Container(),
      ),
      // spacer
      const SizedBox(height: 10),
    ];

    final _content = Padding(
      padding: const EdgeInsets.all(15),
      child: TransactionsListView(headers: headers),
    );

    final _floatingActionButton = FloatingActionButton.extended(
      heroTag: null,
      onPressed: () {
        //
      },
      icon: const Icon(Icons.send),
      label: const Text('Send'),
    );

    return Scaffold(
      floatingActionButton: _floatingActionButton,
      body: _content,
    );
  }
}

class TransferTab extends StatefulWidget {
  const TransferTab({Key? key}) : super(key: key);

  @override
  _TransferTabState createState() => _TransferTabState();
}
