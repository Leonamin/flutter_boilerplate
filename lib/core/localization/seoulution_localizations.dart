import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/generated/l10n/app_localizations.dart';
import 'temp_text_manager.dart';

/// 서울루션 다국어화 헬퍼
/// intl과 임시 문자열을 통합하여 개발 친화적인 인터페이스 제공
class S {
  static AppLocalizations? _localizations;

  /// BuildContext에서 AppLocalizations 가져오기
  static AppLocalizations of(BuildContext context) {
    _localizations = AppLocalizations.of(context);
    return _localizations!;
  }

  /// 현재 설정된 localizations 반환 (context 없이 사용 가능)
  static AppLocalizations get current {
    assert(_localizations != null, 'S.of(context)를 먼저 호출해주세요.');
    return _localizations!;
  }

  // ==========================================================================
  // 임시 문자열 메서드들 (개발 중 빠른 작업용)
  // ==========================================================================

  /// 일반 임시 텍스트
  static String temp(String text, {String? description}) {
    return TempTextManager.temp(text, description: description);
  }

  /// 키 기반 임시 텍스트 (나중에 intl로 쉽게 변환)
  static String tempKey(
    String key,
    String fallbackText, {
    String? description,
  }) {
    return TempTextManager.tempKey(key, fallbackText, description: description);
  }

  /// 버튼 텍스트
  static String tempButton(String text, {String? description}) {
    return TempTextManager.tempButton(text, description: description);
  }

  /// 에러 메시지
  static String tempError(String text, {String? description}) {
    return TempTextManager.tempError(text, description: description);
  }

  /// 라벨 텍스트
  static String tempLabel(String text, {String? description}) {
    return TempTextManager.tempLabel(text, description: description);
  }

  /// 일반 메시지
  static String tempMessage(String text, {String? description}) {
    return TempTextManager.tempMessage(text, description: description);
  }
}
