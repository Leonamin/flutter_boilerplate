import 'package:flutter/foundation.dart';

/// 로깅 유틸리티 클래스
class Logger {
  static const String _defaultTag = 'App';

  /// 디버그 로그
  static void debug(String message, {String? tag}) {
    if (kDebugMode) {
      print('[DEBUG][${tag ?? _defaultTag}] $message');
    }
  }

  /// 정보 로그
  static void info(String message, {String? tag}) {
    if (kDebugMode) {
      print('[INFO][${tag ?? _defaultTag}] $message');
    }
  }

  /// 경고 로그
  static void warning(String message, {String? tag}) {
    if (kDebugMode) {
      print('[WARNING][${tag ?? _defaultTag}] $message');
    }
  }

  /// 에러 로그
  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      print('[ERROR][${tag ?? _defaultTag}] $message');
      if (error != null) {
        print('Error: $error');
      }
      if (stackTrace != null) {
        print('StackTrace: $stackTrace');
      }
    }
  }
}
