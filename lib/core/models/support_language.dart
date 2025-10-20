import 'package:flutter/material.dart';

/// 앱에서 지원하는 언어 설정 열거형 (intl 호환)
enum SupportedLanguage {
  /// 한국어
  korean('ko', 'Korean', '한국어'),

  /// 영어
  english('en', 'English', 'English'),

  /// 일본어
  japanese('ja', 'Japanese', '日本語'),

  /// 중국어 (간체)
  chineseSimplified('zh_Hans', 'Chinese (Simplified)', '中文 (简体)'),

  /// 중국어 (고체)
  chineseTraditional('zh_Hant', 'Chinese (Traditional)', '中文 (繁體)');

  const SupportedLanguage(this.code, this.englishName, this.nativeName);

  /// ISO 639-1 언어 코드 (intl 호환)
  final String code;

  /// 영어 이름
  final String englishName;

  /// 현지 언어 이름
  final String nativeName;

  /// String 코드로부터 SupportedLanguage 생성
  static SupportedLanguage fromCode(String code) {
    switch (code) {
      case 'ko':
        return SupportedLanguage.korean;
      case 'en':
        return SupportedLanguage.english;
      case 'ja':
        return SupportedLanguage.japanese;
      case 'zh-Hans':
      case 'zh_Hans':
      case 'zh-CN':
        return SupportedLanguage.chineseSimplified;
      case 'zh-Hant':
      case 'zh_Hant':
      case 'zh-TW':
        return SupportedLanguage.chineseTraditional;
      case 'zh':
        return SupportedLanguage.chineseSimplified; // 기본 중국어는 간체로
      default:
        return SupportedLanguage.english; // 기본값
    }
  }

  /// Locale로부터 SupportedLanguage 생성
  static SupportedLanguage fromLocale(Locale locale) {
    if (locale.languageCode == 'zh') {
      if (locale.scriptCode == 'Hant') {
        return SupportedLanguage.chineseTraditional;
      }
      return SupportedLanguage.chineseSimplified;
    }
    return fromCode(locale.languageCode);
  }

  /// 지원되는 모든 언어 목록
  static List<SupportedLanguage> get supportedLanguages =>
      SupportedLanguage.values;

  /// intl에서 사용할 Locale 생성
  String get localeString => code;

  /// Flutter Locale 객체 생성
  Locale toLocale() {
    switch (this) {
      case SupportedLanguage.chineseSimplified:
        return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      case SupportedLanguage.chineseTraditional:
        return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
      default:
        return Locale(code);
    }
  }

  /// 사용자에게 표시할 텍스트 (현지 언어)
  String get displayName => nativeName;

  /// 설정 화면에서 표시할 텍스트 (영어 + 현지 언어)
  String get settingDisplayName => '$englishName ($nativeName)';
}
