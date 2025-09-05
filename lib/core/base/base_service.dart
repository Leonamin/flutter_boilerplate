import 'package:flutter_boilerplate/core/utils/logger.dart';

/// 모든 Service의 기본 클래스
/// 비즈니스 로직을 처리하는 서비스 레이어
abstract class BaseService {
  /// 서비스 이름 (로깅용)
  String get serviceName => runtimeType.toString();

  /// 서비스 초기화
  void init() {
    Logger.info('Service initialized', tag: serviceName);
  }

  /// 서비스 해제
  void dispose() {
    Logger.info('Service disposed', tag: serviceName);
  }

  /// 에러 로깅
  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.error(message, tag: serviceName, error: error, stackTrace: stackTrace);
  }

  /// 정보 로깅
  void logInfo(String message) {
    Logger.info(message, tag: serviceName);
  }

  /// 디버그 로깅
  void logDebug(String message) {
    Logger.debug(message, tag: serviceName);
  }
}
