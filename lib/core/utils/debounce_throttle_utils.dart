import 'dart:async';
import 'package:flutter/foundation.dart';

/// 디바운싱과 스로틀링 기능을 제공하는 유틸리티 클래스
class DebounceThrottleUtils {
  static final Map<String, Timer> _debounceTimers = {};
  static final Map<String, DateTime> _throttleLastExecution = {};

  /// 디바운싱: 마지막 호출 후 지정된 시간이 지나면 실행
  /// [key]: 고유 식별자 (같은 키로 여러 번 호출하면 이전 타이머가 취소됨)
  /// [duration]: 대기 시간
  /// [action]: 실행할 함수
  static void debounce(
    String key,
    Duration duration,
    VoidCallback action,
  ) {
    // 기존 타이머가 있으면 취소
    _debounceTimers[key]?.cancel();
    
    // 새 타이머 설정
    _debounceTimers[key] = Timer(duration, () {
      action();
      _debounceTimers.remove(key);
    });
  }

  /// 비동기 디바운싱: 마지막 호출 후 지정된 시간이 지나면 실행
  /// [key]: 고유 식별자
  /// [duration]: 대기 시간
  /// [action]: 실행할 비동기 함수
  static void debounceAsync(
    String key,
    Duration duration,
    Future<void> Function() action,
  ) {
    // 기존 타이머가 있으면 취소
    _debounceTimers[key]?.cancel();
    
    // 새 타이머 설정
    _debounceTimers[key] = Timer(duration, () async {
      await action();
      _debounceTimers.remove(key);
    });
  }

  /// 스로틀링: 지정된 시간 간격으로만 실행 허용
  /// [key]: 고유 식별자
  /// [duration]: 최소 실행 간격
  /// [action]: 실행할 함수
  /// [immediate]: true면 첫 호출 시 즉시 실행, false면 간격 후 실행
  static void throttle(
    String key,
    Duration duration,
    VoidCallback action, {
    bool immediate = true,
  }) {
    final now = DateTime.now();
    final lastExecution = _throttleLastExecution[key];
    
    if (lastExecution == null || 
        now.difference(lastExecution) >= duration) {
      
      if (immediate) {
        action();
        _throttleLastExecution[key] = now;
      } else {
        Timer(duration, () {
          action();
          _throttleLastExecution[key] = DateTime.now();
        });
      }
    }
  }

  /// 비동기 스로틀링: 지정된 시간 간격으로만 실행 허용
  /// [key]: 고유 식별자
  /// [duration]: 최소 실행 간격
  /// [action]: 실행할 비동기 함수
  /// [immediate]: true면 첫 호출 시 즉시 실행, false면 간격 후 실행
  static void throttleAsync(
    String key,
    Duration duration,
    Future<void> Function() action, {
    bool immediate = true,
  }) {
    final now = DateTime.now();
    final lastExecution = _throttleLastExecution[key];
    
    if (lastExecution == null || 
        now.difference(lastExecution) >= duration) {
      
      if (immediate) {
        action();
        _throttleLastExecution[key] = now;
      } else {
        Timer(duration, () async {
          await action();
          _throttleLastExecution[key] = DateTime.now();
        });
      }
    }
  }

  /// 특정 키의 디바운스 타이머 취소
  static void cancelDebounce(String key) {
    _debounceTimers[key]?.cancel();
    _debounceTimers.remove(key);
  }

  /// 특정 키의 스로틀 상태 초기화
  static void resetThrottle(String key) {
    _throttleLastExecution.remove(key);
  }

  /// 모든 디바운스 타이머 취소
  static void cancelAllDebounce() {
    for (final timer in _debounceTimers.values) {
      timer.cancel();
    }
    _debounceTimers.clear();
  }

  /// 모든 스로틀 상태 초기화
  static void resetAllThrottle() {
    _throttleLastExecution.clear();
  }

  /// 모든 상태 초기화
  static void clearAll() {
    cancelAllDebounce();
    resetAllThrottle();
  }
}

/// 간편한 디바운싱을 위한 확장 함수들
extension DebounceExtension on VoidCallback {
  /// 디바운싱된 함수 실행
  void debounce(String key, Duration duration) {
    DebounceThrottleUtils.debounce(key, duration, this);
  }

  /// 스로틀링된 함수 실행
  void throttle(String key, Duration duration, {bool immediate = true}) {
    DebounceThrottleUtils.throttle(key, duration, this, immediate: immediate);
  }
}

extension AsyncDebounceExtension on Future<void> Function() {
  /// 비동기 디바운싱된 함수 실행
  void debounceAsync(String key, Duration duration) {
    DebounceThrottleUtils.debounceAsync(key, duration, this);
  }

  /// 비동기 스로틀링된 함수 실행
  void throttleAsync(String key, Duration duration, {bool immediate = true}) {
    DebounceThrottleUtils.throttleAsync(key, duration, this, immediate: immediate);
  }
}
