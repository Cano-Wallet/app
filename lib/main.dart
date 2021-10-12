import 'package:example/playground/playground.screen.dart';
import 'package:example/utils/my_loggy.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PlaygroundScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(),
      ),
    );
  }
}

void main() {
  Loggy.initLoggy(
    logPrinter: const MyPrinter(),
    logOptions: const LogOptions(LogLevel.all),
  );

  runApp(const MyApp());
}
