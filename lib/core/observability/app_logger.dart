import 'dart:developer' as developer;

abstract final class AppLogger {
  static void error(Object error, StackTrace stackTrace) {
    developer.log(
      error.toString(),
      name: 'flutter_boilerplate',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
