import 'package:hive/hive.dart';

part 'node.hive.g.dart';

@HiveType(typeId: 0)
class HiveNode extends HiveObject {
  @HiveField(0)
  String host;
  @HiveField(1)
  String label;

  HiveNode({
    required this.host,
    required this.label,
  });

  factory HiveNode.fromJson(Map<String, dynamic> json) => HiveNode(
        host: json["host"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "host": host,
        "label": label,
      };
}
