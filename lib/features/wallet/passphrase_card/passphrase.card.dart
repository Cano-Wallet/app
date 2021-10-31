import 'package:example/core/utils/console.dart';
import 'package:example/features/general/segmented_switch.widget.dart';
import 'package:example/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassphraseCard extends GetWidget<PassphraseCardController>
    with ConsoleMixin {
  final bool confirmMode;

  const PassphraseCard({
    Key? key,
    this.confirmMode = false,
  }) : super(key: key);

  String obtainSeed() {
    return controller.seedController.text;
  }

  @override
  Widget build(BuildContext context) {
    controller.init(confirmMode: confirmMode);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!confirmMode) ...[
          SegmentedSwitch(
            tabs: ['24 words', '12 words'].map((e) => Tab(text: e)).toList(),
            onChanged: controller.strengthIndexChanged,
          ),
        ],
        TextFormField(
          controller: controller.seedController,
          minLines: 5,
          maxLines: 5,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (text) => controller.validateSeed(text!),
        ),
      ],
    );
  }
}
