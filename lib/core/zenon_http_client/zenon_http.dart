import 'dart:async';
import 'package:cano/core/utils/console.dart';
import 'package:http/http.dart' as http;

import 'package:znn_sdk_dart/znn_sdk_dart.dart';

extension ZenonExtension on Zenon {
  ZenonHttpClient get httpClient => ZenonHttpClient();
}

class ZenonHttpClient with ConsoleMixin implements Client {
  http.Client? _httpClient;

  Uri? uri;

  Future<bool> initialize(String url, {bool retry = true}) async {
    uri = Uri.parse(url);
    _httpClient = http.Client();

    console.info('initializing http connection ...');

    // final client = RetryClient(http.Client());

    // try {
    //   print(await client.read(Uri.parse('http://example.org')));
    // } finally {
    //   client.close();
    // }

    // do {
    //   var ws = WebSocket.connect(url).timeout(Duration(seconds: 5));

    //   try {
    //     var wsConnection = await ws;
    //     logger.info('websocket connection established successfully');

    //     wsConnection.pingInterval = Duration(seconds: 5);
    //     var wsStream = jsonDocument
    //         .bind(IOWebSocketChannel(wsConnection).cast<String>())
    //         .transformStream(ignoreFormatExceptions);

    //     var stream = wsStream.stream.asBroadcastStream();
    //     _wsResponseBroadcaster = stream.cast<Map<String, dynamic>?>();
    //     _wsRpc2Client =
    //         jsonrpc2.Client.withoutJson(StreamChannel.withGuarantees(
    //       stream,
    //       wsStream.sink,
    //     ));

    //     _websocketIntendedState = WebsocketState.running;

    //     _wsRpc2Client!.listen().then((_) {
    //       restart();
    //     });

    //     _onConnectionCallbacks
    //         .forEach((callback) => callback(_wsResponseBroadcaster!));

    //     return true;
    //   } on TimeoutException {
    //   } on SocketException {
    //     if (retry == true) {
    //       await Future.delayed(Duration(seconds: 5));
    //     }
    //   }
    // } while (retry);

    return true;
  }

  @override
  Future sendRequest(String method, [parameters]) {
    // TODO: check for network connectivity
    // if (isClosed()) throw NoConnection;

    return _httpClient!.post(
      uri!,
      body: {
        "jsonrpc": "2.0",
        "id": 40,
        "method": method,
        "params": parameters,
      },
    );
  }
}
