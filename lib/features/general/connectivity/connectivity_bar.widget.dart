import 'package:app_settings/app_settings.dart';
import 'package:example/features/general/connectivity/connectivity_bar.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityBar extends StatelessWidget {
  const ConnectivityBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConnectivityController.to.connected()
          ? const SizedBox.shrink()
          : InkWell(
              onTap: AppSettings.openWIFISettings,
              child: Container(
                height: 20,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'No internet connection',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
            ),
    );
  }
}
