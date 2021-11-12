import 'package:znn_sdk_dart/znn_sdk_dart.dart';

extension StakeEntryExtension on StakeEntry {
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['weightedAmount'] = weightedAmount;
    data['startTimestamp'] = startTimestamp;
    data['expirationTimestamp'] = expirationTimestamp;
    data['address'] = address.toString();
    data['id'] = id.toString();
    return data;
  }
}

extension PeerExtension on Peer {
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['publicKey'] = publicKey;
    data['ip'] = ip;
    return data;
  }
}
