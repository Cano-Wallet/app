import 'dart:developer' as developer;

import 'package:loggy/loggy.dart';

mixin MyLoggy implements LoggyType {
  @override
  Loggy<MyLoggy> get loggy => Loggy<MyLoggy>('$runtimeType');
}

Loggy<MyLoggy> initLoggy(final String className) => Loggy<MyLoggy>(className);

class MyPrinter extends LoggyPrinter {
  const MyPrinter({this.colorize = true}) : super();

  final bool colorize;

  static final _levelColors = {
    LogLevel.debug:
        AnsiColor(foregroundColor: AnsiColor.grey(0.5), italic: true),
    LogLevel.info: AnsiColor(foregroundColor: 004),
    LogLevel.warning: AnsiColor(foregroundColor: 173),
    LogLevel.error: AnsiColor(foregroundColor: 167),
    // LogLevel.off: AnsiColor(foregroundColor: 167),
    // LogLevel.all: AnsiColor(foregroundColor: 167),
  };

  static final _levelPrefixes = {
    LogLevel.debug: '🪲 ',
    LogLevel.info: '',
    LogLevel.warning: '',
    LogLevel.error: '',
  };

  @override
  void onLog(LogRecord record) {
    final _color = colorize ? _levelColors[record.level] : AnsiColor();
    final _prefix = _levelPrefixes[record.level];

    developer.log(
      // _prefix! + _color!('${record.loggerName}: ${record.message}'),
      _prefix! + _color!(record.message),
      name: 'APP',
      error: record.error,
      stackTrace: record.stackTrace,
      level: record.level.priority,
      time: record.time,
      zone: record.zone,
      sequenceNumber: record.sequenceNumber,
    );

    if (record.stackTrace != null) print(record.stackTrace);
  }

  // String levelPrefix(LogLevel level) => _levelPrefixes[level];

  // AnsiColor levelColor(LogLevel level) => _levelColors[level];
}
