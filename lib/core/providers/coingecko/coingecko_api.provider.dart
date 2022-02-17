import 'dart:convert';

import 'package:cano/core/models/coingecko/simple_response.model.dart';
import 'package:get/get_connect/connect.dart';
import 'package:supercharged/supercharged.dart';

class CoinGeckoApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://api.coingecko.com/api/v3/";
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = 10.seconds;
    super.onInit();
  }

  Future<CoinGeckoSimpleResponse> fetchZNNPrice() async {
    final response = await get(
        'https://api.coingecko.com/api/v3/simple/price?ids=zenon&vs_currencies=usd');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return CoinGeckoSimpleResponse.fromJson(jsonDecode(response.bodyString!));
    }
  }
}
