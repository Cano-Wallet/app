import 'package:hive/hive.dart';

import 'address.hive.dart';

part 'token.hive.g.dart';

@HiveType(typeId: 3)
class HiveToken extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String symbol;
  @HiveField(2)
  String domain;
  @HiveField(3)
  int totalSupply;
  @HiveField(4)
  int decimals;
  @HiveField(5)
  HiveAddress owner;
  @HiveField(6)
  HiveTokenStandard tokenStandard;
  @HiveField(7)
  int maxSupply;
  @HiveField(8)
  bool isBurnable;
  @HiveField(9)
  bool isMintable;
  @HiveField(10)
  bool isUtility;

  HiveToken({
    required this.name,
    required this.symbol,
    required this.domain,
    required this.totalSupply,
    required this.decimals,
    required this.owner,
    required this.tokenStandard,
    required this.maxSupply,
    required this.isBurnable,
    required this.isMintable,
    required this.isUtility,
  });

  factory HiveToken.fromJson(Map<String, dynamic> json) => HiveToken(
        name: json["name"],
        symbol: json["symbol"],
        domain: json["domain"],
        totalSupply: json["totalSupply"],
        decimals: json["decimals"],
        owner: HiveAddress.fromJson(json["owner"]),
        tokenStandard: HiveTokenStandard.fromJson(json["tokenStandard"]),
        maxSupply: json["maxSupply"],
        isBurnable: json["isBurnable"],
        isMintable: json["isMintable"],
        isUtility: json["isUtility"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "domain": domain,
        "totalSupply": totalSupply,
        "decimals": decimals,
        "owner": owner.toJson(),
        "tokenStandard": tokenStandard.toJson(),
        "maxSupply": maxSupply,
        "isBurnable": isBurnable,
        "isMintable": isMintable,
        "isUtility": isUtility,
      };
}

@HiveType(typeId: 4)
class HiveTokenStandard extends HiveObject {
  @HiveField(0)
  String hrp;
  @HiveField(1)
  List<int> core;

  HiveTokenStandard({
    required this.hrp,
    required this.core,
  });

  factory HiveTokenStandard.fromJson(Map<String, dynamic> json) =>
      HiveTokenStandard(
        hrp: json["hrp"],
        core: json["core"],
      );

  Map<String, dynamic> toJson() => {
        "hrp": hrp,
        "core": core,
      };
}
