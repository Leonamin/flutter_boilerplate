import 'package:flutter/material.dart';

/// 앱의 텍스트 스타일 시스템
/// 다국어 지원과 라인 하이트를 고려한 체계적인 텍스트 스타일 정의
class AppTextStyles {
  AppTextStyles._();

  // 기본 폰트 패밀리 - 시스템 폰트 사용으로 다국어 지원
  static const String _fontFamily = 'System';

  // 기본 letter spacing 값들
  static const double _tightLetterSpacing = -0.5;
  static const double _normalLetterSpacing = 0.0;
  static const double _wideLetterSpacing = 0.5;

  /// Display Large - 가장 큰 제목 (예: 랜딩 페이지 메인 타이틀)
  static const TextStyle displayLg = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    letterSpacing: _tightLetterSpacing,
    height: 1.1, // 52.8px line height
  );

  /// Display - 큰 제목 (예: 페이지 타이틀)
  static const TextStyle display = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: _tightLetterSpacing,
    height: 1.15, // 41.4px line height
  );

  /// Header 1 - 주요 섹션 제목
  static const TextStyle header1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: _normalLetterSpacing,
    height: 1.2, // 33.6px line height
  );

  /// Header 2 - 서브 섹션 제목
  static const TextStyle header2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: _normalLetterSpacing,
    height: 1.25, // 30px line height
  );

  /// Header 3 - 작은 섹션 제목
  static const TextStyle header3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: _normalLetterSpacing,
    height: 1.3, // 26px line height
  );

  /// Body Large - 큰 본문 텍스트 (예: 중요한 설명)
  static const TextStyle bodyLg = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: _normalLetterSpacing,
    height: 1.4, // 25.2px line height
  );

  /// Body - 기본 본문 텍스트
  static const TextStyle body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: _normalLetterSpacing,
    height: 1.45, // 23.2px line height
  );

  /// Caption Large - 큰 캡션 (예: 버튼 텍스트, 라벨)
  static const TextStyle captionLg = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: _wideLetterSpacing,
    height: 1.4, // 19.6px line height
  );

  /// Caption - 기본 캡션 (예: 설명 텍스트, 메타 정보)
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: _wideLetterSpacing,
    height: 1.35, // 16.2px line height
  );

  /// Tiny - 가장 작은 텍스트 (예: 법적 고지, 저작권)
  static const TextStyle tiny = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 8,
    fontWeight: FontWeight.w400,
    letterSpacing: _wideLetterSpacing,
    height: 1.4, // 14px line height
  );

  // 특수 목적 스타일들

  /// 버튼 텍스트 스타일
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: _wideLetterSpacing,
    height: 1.25,
  );

  /// 링크 텍스트 스타일
  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: _normalLetterSpacing,
    height: 1.45,
    decoration: TextDecoration.underline,
  );

  /// 가격 표시 스타일
  static const TextStyle price = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: _normalLetterSpacing,
    height: 1.2,
  );

  /// 평점 표시 스타일
  static const TextStyle rating = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: _normalLetterSpacing,
    height: 1.3,
  );

  /// 상태 표시 스타일 (예: 예약 상태)
  static const TextStyle status = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: _wideLetterSpacing,
    height: 1.2,
  );

  /// 오버라인 스타일 (예: 카테고리, 태그)
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 8,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    height: 1.6,
  );
}
