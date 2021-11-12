import 'package:flutter/material.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send'),
      ),
      body: const Center(
        child: Text('Send'),
      ),
    );
  }
}
