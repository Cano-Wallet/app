import 'package:cano/core/controllers/persistence.controller.dart';
import 'package:cano/core/utils/globals.dart';
import 'package:cano/core/utils/styles.dart';
import 'package:cano/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

// TODO: scrap this when mobile support is out
class ViewingAddressScreen extends StatelessWidget {
  const ViewingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final addressController = TextEditingController();

    String? validateAddress(String text) {
      if (!Address.isValid(text)) {
        return 'Invalid address';
      } else {
        return null;
      }
    }

    void submit() {
      if (!formKey.currentState!.validate()) return;

      // save viewing address to persistence
      PersistenceController.to.viewingAddress.val = addressController.text;
      // set global viewing address
      viewingAddress = Address.parse(addressController.text);
      // go to main screen
      Get.offNamedUntil(Routes.main, (route) => false);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            constraints: kMaxContainerConstraints,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Since KeyStores are not yet fully supported for mobile in the current Zenon Dart SDK, mobile users are limited to viewing features only, for now.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // TODO: do proper validation here
                  TextFormField(
                    controller: addressController,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) => validateAddress(text!),
                    onFieldSubmitted: (text) => submit,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Your Wallet Address',
                    ),
                  ),
                  TextButton.icon(
                    label: const Text('Continue'),
                    icon: const Icon(LineIcons.arrowRight),
                    onPressed: submit,
                  ),
                  const Divider(),
                  const Text('or'),
                  TextButton.icon(
                    label: const Text('Use Provided Test Address'),
                    icon: const Icon(LineIcons.arrowRight),
                    onPressed: () => addressController.text = kTestAddress,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
