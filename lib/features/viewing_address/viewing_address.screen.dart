import 'package:app/core/controllers/persistence.controller.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/features/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Center(
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
                    decoration: const InputDecoration(
                      hintText: 'Your Wallet Address',
                    ),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) => validateAddress(text!),
                  ),
                  ElevatedButton(
                    child: const Text('Continue'),
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      // save viewing address to persistence
                      PersistenceController.to.viewingAddress.val =
                          addressController.text;
                      // set global viewing address
                      viewingAddress = Address.parse(addressController.text);
                      // go to main screen
                      Get.offNamedUntil(Routes.main, (route) => false);
                    },
                  ),
                  const Divider(),
                  const Text('or'),
                  ElevatedButton(
                    child: const Text('Use Provided Test Address'),
                    onPressed: () {
                      addressController.text = kTestAddress;
                    },
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
