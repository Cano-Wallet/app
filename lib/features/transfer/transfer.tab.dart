import 'package:flutter/material.dart';

class _TransferTabState extends State<TransferTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const Scaffold(
      body: Center(
        child: Text('Transfer Tab'),
      ),
    );
  }
}

class TransferTab extends StatefulWidget {
  const TransferTab({Key? key}) : super(key: key);

  @override
  _TransferTabState createState() => _TransferTabState();
}
