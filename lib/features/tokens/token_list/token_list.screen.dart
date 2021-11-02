import 'package:app/features/tokens/token_list/token_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokenListScreen extends GetView<TokenListScreenController> {
  const TokenListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Token List')),
      body: controller.content(),
    );
  }
}
