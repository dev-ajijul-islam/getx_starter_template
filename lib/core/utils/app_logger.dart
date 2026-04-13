import 'dart:developer';
import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void info(String message) {
    _log('INFO', message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _log('ERROR', message, error: error, stackTrace: stackTrace);
  }

  static void debug(String message) {
    if (kDebugMode) {
      _log('DEBUG', message);
    }
  }

  static void _log(String level, String message, {dynamic error, StackTrace? stackTrace}) {
    log(
      '[$level] $message',
      name: 'APP_LOG',
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
  }
}
