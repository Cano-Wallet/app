import 'package:example/playground/playground.screen.dart';
import 'package:example/utils/my_loggy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:desktop_window/desktop_window.dart';

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
  WidgetsFlutterBinding.ensureInitialized();

  Loggy.initLoggy(
    logPrinter: const MyPrinter(),
    logOptions: const LogOptions(LogLevel.all),
  );

  _setupWindowSize();
  runApp(const MyApp());
}

void _setupWindowSize() async {
  if (GetPlatform.isDesktop) {
    const size = Size(950, 1400);
    await DesktopWindow.setWindowSize(size);
    await DesktopWindow.setMinWindowSize(size);
  }
}
