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
      appBar: AppBar(
        title: const Text('View Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            constraints: Styles.containerConstraints,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Why View Mode?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Since KeyStores are not yet fully supported for mobile in the current Zenon Dart SDK.\nMobile users are limited to viewing features only, for now until the Zenon devs release the full source with mobile support.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  // TODO: do proper validation here
                  TextFormField(
                    controller: addressController,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) => validateAddress(text!),
                    onFieldSubmitted: (text) => submit,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Your Wallet Address',
                    ),
                  ),
                  const SizedBox(height: 15),
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
                    onPressed: () => addressController.text =
                        developerFundAddress.toString(),
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
