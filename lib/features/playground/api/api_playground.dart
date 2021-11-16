import 'package:cano/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_playground.controller.dart';

class APIPlayground extends StatelessWidget {
  const APIPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(APIPlaygroundController());

    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'API',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            TextField(
              controller: controller.rpcUrlController,
              decoration: Styles.inputDecoration.copyWith(
                labelText: 'JSON-RPC URL',
              ),
            ),
            TextField(
              controller: controller.methodController,
              decoration: Styles.inputDecoration.copyWith(
                labelText: 'Method',
              ),
            ),
            TextField(
              controller: controller.parametersController,
              decoration: Styles.inputDecoration.copyWith(
                labelText: 'Parameters',
                hintText:
                    'Supports multiple types in array: String, int, double',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: controller.wsRequest,
              icon: const Icon(Icons.send),
              label: const Text('Send WS Request'),
            ),
            // const SizedBox(height: 20),
            // ElevatedButton.icon(
            //   onPressed: controller.httpRequest,
            //   icon: const Icon(Icons.send),
            //   label: const Text('Send HTTP Request'),
            // ),
            const Divider(),
            ListTile(
              title: const Text(
                'Response',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Obx(() => Text(controller.apiResult())),
            ),
            const SizedBox(height: 20),
            const Text(
              'Others',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: controller.info,
                  child: const Text('Print Info'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.nativeRequest,
                  child: const Text('Native Request'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
