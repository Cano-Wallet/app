import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'others_playground.controller.dart';

class OthersPlayground extends StatelessWidget {
  const OthersPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OthersPlaygroundController());

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Others',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Welcome Screen'),
              onPressed: () => Get.toNamed(Routes.welcome),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Reset Wallet'),
              onPressed: () => Get.toNamed(Routes.resetWallet),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
