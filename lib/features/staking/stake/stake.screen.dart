import 'package:flutter/material.dart';

class StakeScreen extends StatelessWidget {
  const StakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stake'),
      ),
      body: const Center(
        child: Text('Stake'),
      ),
    );
  }
}
