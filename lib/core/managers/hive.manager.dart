import 'package:cano/core/models/hive/address.hive.dart';
import 'package:cano/core/models/hive/node.hive.dart';
import 'package:cano/core/models/hive/notification.hive.dart';
import 'package:cano/core/models/hive/token.hive.dart';
import 'package:cano/core/utils/console.dart';
import 'package:hive/hive.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

class HiveManager {
  static final console = Console(name: 'HiveManager');

  // VARIABLES
  static Box<HiveNode>? nodes;
  static Box<HiveAddress>? addresses;
  static Box<HiveAddress>? contacts;
  static Box<HiveNotification>? notifications;
  static Box<HiveToken>? favouriteTokens;

  // GETTERS

  // INIT
  static void init() async {
    Hive.init("${znnDefaultPaths.cache.path}/hive/");

    // REGISTER ADAPTERS
    Hive.registerAdapter(HiveNodeAdapter());
    Hive.registerAdapter(HiveAddressAdapter());
    Hive.registerAdapter(HiveTokenAdapter());
    Hive.registerAdapter(HiveNotificationAdapter());

    // OPEN BOXES
    await _openBoxes();

    console.info("init");
  }

  static Future<void> _openBoxes() async {
    nodes = await Hive.openBox('nodes');
    addresses = await Hive.openBox('addresses');
    contacts = await Hive.openBox('contacts');
    notifications = await Hive.openBox('notifications');
    favouriteTokens = await Hive.openBox('favouriteTokens');
  }

  static void reset() {
    nodes?.clear();
    addresses?.clear();
    contacts?.clear();
    notifications?.clear();
    favouriteTokens?.clear();
  }
}
