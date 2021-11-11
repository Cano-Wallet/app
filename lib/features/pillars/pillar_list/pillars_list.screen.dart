import 'package:app/features/general/z_card.widget.dart';
import 'package:app/features/pillars/pillar_list/pillar_list_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PillarListScreen extends StatelessWidget {
  const PillarListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headers = [
      const ZCard(
        child: Text(
          'Pillar Rewards',
          style: TextStyle(fontSize: 16),
        ),
      ),
      ZCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '10,000 tZNN',
              style: TextStyle(fontSize: 16),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Collect'),
            ),
          ],
        ),
      ),
    ];

    final controller = Get.put(
      PillarListScreenController(listHeaders: headers),
    );

    return controller.content();
  }
}
