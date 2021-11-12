import 'package:app/core/utils/console.dart';
import 'package:app/core/utils/globals.dart';
import 'package:app/core/utils/utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class AboutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutScreenController());
  }
}

class AboutScreenController extends GetxController with ConsoleMixin {
  static AboutScreenController get to => Get.find();

  // VARIABLES

  // PROPERTIES
  final nodeOsInfo = Rxn<OsInfo>();
  final clientOsName = ''.obs;
  final clientOsVersion = ''.obs;
  final clientOsDevice = ''.obs;
  final packageInfo = Rxn<PackageInfo>();

  // GETTERS
  String get appVersion =>
      '${packageInfo()?.version}+${packageInfo()?.buildNumber}';

  // INIT
  @override
  void onInit() async {
    fetch();

    packageInfo.value = await PackageInfo.fromPlatform();

    final deviceInfo = DeviceInfoPlugin();

    if (GetPlatform.isIOS) {
      final info = await deviceInfo.iosInfo;
      clientOsName.value = 'iOS';
      clientOsVersion.value = info.systemVersion.toString();
    } else if (GetPlatform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      clientOsName.value = 'Android';
      clientOsVersion.value = info.version.release.toString();
    } else if (GetPlatform.isMacOS) {
      final info = await deviceInfo.macOsInfo;
      clientOsName.value = 'MacOS';
      clientOsVersion.value = info.osRelease;
    } else if (GetPlatform.isLinux) {
      final info = await deviceInfo.linuxInfo;
      clientOsName.value = 'Linux';
      clientOsVersion.value = info.version!;
    } else if (GetPlatform.isWindows) {
      // final info = await deviceInfo.windowsInfo;
      clientOsName.value = 'Windows';
      clientOsVersion.value = ''; // TODO: needs work
    } else if (GetPlatform.isWeb) {
      final info = await deviceInfo.webBrowserInfo;
      clientOsName.value = 'Web';
      clientOsVersion.value = info.appVersion!;
    }

    // TODO: add support for more OS

    super.onInit();
  }

  // FUNCTIONS

  void fetch() async {
    final zenon = Zenon();
    nodeOsInfo.value = await zenon.stats.osInfo();
    console.info('done');
  }

  void copyCommunityFundAddress() {
    Utils.copyToClipboard(communityFundAddress.toString());
  }

  void copyDeveloperFundAddress() {
    Utils.copyToClipboard(developerFundAddress.toString());
  }
}
