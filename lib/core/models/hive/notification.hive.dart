import 'package:hive/hive.dart';

part 'notification.hive.g.dart';

@HiveType(typeId: 2)
class HiveNotification extends HiveObject {
  @HiveField(0)
  String type;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime dateTime;

  HiveNotification({
    required this.type,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory HiveNotification.fromJson(Map<String, dynamic> json) =>
      HiveNotification(
        type: json["type"],
        title: json["title"],
        description: json["description"],
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "description": description,
        "dateTime": dateTime,
      };
}
