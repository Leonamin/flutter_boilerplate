
import 'package:flutter_boilerplate/core/utils/logger.dart';

/// 모든 Repository의 기본 클래스
/// 데이터 접근 레이어 (API, Local DB 등)
abstract class BaseRepository {
  /// 리포지토리 이름 (로깅용)
  String get repositoryName => runtimeType.toString();

  /// 리포지토리 초기화
  void init() {
    Logger.info('Repository initialized', tag: repositoryName);
  }

  /// 리포지토리 해제
  void dispose() {
    Logger.info('Repository disposed', tag: repositoryName);
  }

  /// 에러 로깅
  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    Logger.error(message, tag: repositoryName, error: error, stackTrace: stackTrace);
  }

  /// 정보 로깅
  void logInfo(String message) {
    Logger.info(message, tag: repositoryName);
  }

  /// 디버그 로깅
  void logDebug(String message) {
    Logger.debug(message, tag: repositoryName);
  }

  /// API 요청 래퍼 (에러 처리 포함)
  Future<T> executeApiCall<T>(
    Future<T> Function() apiCall, {
    String? operationName,
  }) async {
    try {
      final operation = operationName ?? 'API Call';
      logDebug('$operation started');
      
      final result = await apiCall();
      
      logDebug('$operation completed successfully');
      return result;
    } catch (error, stackTrace) {
      final operation = operationName ?? 'API Call';
      logError('$operation failed', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
