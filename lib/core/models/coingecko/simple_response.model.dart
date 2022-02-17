class CoinGeckoSimpleResponse {
  final Zenon zenon;

  CoinGeckoSimpleResponse({required this.zenon});

  factory CoinGeckoSimpleResponse.fromJson(Map<String, dynamic> json) =>
      CoinGeckoSimpleResponse(
        zenon: Zenon.fromJson(json["zenon"]),
      );

  Map<String, dynamic> toJson() => {
        "zenon": zenon.toJson(),
      };
}

class Zenon {
  final double usd;

  Zenon({required this.usd});

  factory Zenon.fromJson(Map<String, dynamic> json) => Zenon(
        usd: json["usd"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "usd": usd,
      };
}
