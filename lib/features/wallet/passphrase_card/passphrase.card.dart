import 'package:cano/core/utils/console.dart';
import 'package:cano/features/general/segmented_switch.widget.dart';
import 'package:cano/features/wallet/passphrase_card/passphrase_card.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bip39/bip39.dart' as bip39;

class PassphraseCard extends GetWidget<PassphraseCardController>
    with ConsoleMixin {
  final PassphraseMode mode;

  const PassphraseCard({
    Key? key,
    this.mode = PassphraseMode.create,
  }) : super(key: key);

  String? obtainSeed() {
    final seed = controller.seedController.text;
    return bip39.validateMnemonic(seed) ? seed : null;
  }

  @override
  Widget build(BuildContext context) {
    controller.init(mode: mode);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (mode == PassphraseMode.create) ...[
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
