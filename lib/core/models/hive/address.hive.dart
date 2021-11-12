import 'package:hive/hive.dart';

part 'address.hive.g.dart';

@HiveType(typeId: 1)
class HiveAddress extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String label;

  HiveAddress({
    required this.id,
    required this.label,
  });

  factory HiveAddress.fromJson(Map<String, dynamic> json) => HiveAddress(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}
