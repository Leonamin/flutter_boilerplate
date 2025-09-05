import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'adaptive_color.dart';

/// 앱의 테마별 색상 정의
/// 텍스트, 배경, 아이콘, 보더 등 용도별로 라이트/다크 테마 색상을 관리
class AppThemeColors {
  AppThemeColors._();

  // ----------------- PRIMARY COLORS (Black Scale) -----------------
  
  /// 프라이머리 메인 색상 (검정 스케일)
  static const AdaptiveColor primary = AdaptiveColor(
    light: AppColors.gray900,
    dark: AppColors.white,
  );

  /// 프라이머리 서브틀 배경
  static const AdaptiveColor primarySubtle = AdaptiveColor(
    light: AppColors.gray50,
    dark: AppColors.gray900,
  );

  /// 프라이머리 볼드 배경색
  static const AdaptiveColor primaryBold = AdaptiveColor(
    light: AppColors.black,
    dark: AppColors.gray200,
  );

  // ----------------- BRAND COLORS -----------------
  
  /// 브랜드 메인 색상
  static const AdaptiveColor brand = AdaptiveColor(
    light: AppColors.primary500,
    dark: AppColors.primary400,
  );

  /// 브랜드 색상 - 호버/프레스 상태
  static const AdaptiveColor brandPressed = AdaptiveColor(
    light: AppColors.primary600,
    dark: AppColors.primary500,
  );

  /// 브랜드 서브틀 배경
  static const AdaptiveColor brandSubtle = AdaptiveColor(
    light: AppColors.primary50,
    dark: AppColors.primary900,
  );

  // ----------------- TEXT COLORS -----------------

  /// 기본 텍스트 색상
  static const AdaptiveColor textPrimary = AdaptiveColor(
    light: AppColors.gray900,
    dark: AppColors.white,
  );

  /// 보조 텍스트 색상
  static const AdaptiveColor textSecondary = AdaptiveColor(
    light: AppColors.gray700,
    dark: AppColors.gray300,
  );

  /// 3차 텍스트 색상
  static const AdaptiveColor textTertiary = AdaptiveColor(
    light: AppColors.gray600,
    dark: AppColors.gray400,
  );

  /// 비활성화된 텍스트
  static const AdaptiveColor textDisabled = AdaptiveColor(
    light: AppColors.gray500,
    dark: AppColors.gray600,
  );

  /// 반전 텍스트 (배경과 대비)
  static const AdaptiveColor textInverse = AdaptiveColor(
    light: AppColors.white,
    dark: AppColors.black,
  );

  /// 브랜드 텍스트
  static const AdaptiveColor textBrand = AdaptiveColor(
    light: AppColors.primary500,
    dark: AppColors.primary400,
  );

  /// 에러 텍스트
  static const AdaptiveColor textError = AdaptiveColor(
    light: AppColors.error500,
    dark: AppColors.error400,
  );

  /// 성공 텍스트
  static const AdaptiveColor textSuccess = AdaptiveColor(
    light: AppColors.success600,
    dark: AppColors.success400,
  );

  /// 경고 텍스트
  static const AdaptiveColor textWarning = AdaptiveColor(
    light: AppColors.warning600,
    dark: AppColors.warning400,
  );

  /// 정보 텍스트
  static const AdaptiveColor textInfo = AdaptiveColor(
    light: AppColors.info600,
    dark: AppColors.info400,
  );

  // ----------------- BACKGROUND COLORS -----------------

  /// 기본 배경색
  static const AdaptiveColor backgroundPrimary = AdaptiveColor(
    light: AppColors.white,
    dark: AppColors.gray900,
  );

  /// 프라이머리 배경색 (검정 스케일)
  static const AdaptiveColor backgroundPrimaryScale = AdaptiveColor(
    light: AppColors.gray900,
    dark: AppColors.white,
  );

  /// 프라이머리 서브틀 배경색
  static const AdaptiveColor backgroundPrimarySubtle = AdaptiveColor(
    light: AppColors.gray50,
    dark: AppColors.gray900,
  );

  /// 프라이머리 볼드 배경색
  static const AdaptiveColor backgroundPrimaryBold = AdaptiveColor(
    light: AppColors.black,
    dark: AppColors.gray200,
  );

  /// 보조 배경색
  static const AdaptiveColor backgroundSecondary = AdaptiveColor(
    light: AppColors.gray50,
    dark: AppColors.gray800,
  );

  /// 3차 배경색
  static const AdaptiveColor backgroundTertiary = AdaptiveColor(
    light: AppColors.gray100,
    dark: AppColors.gray700,
  );

  /// 보조 볼드 배경색
  static const AdaptiveColor backgroundSecondaryBold = AdaptiveColor(
    light: AppColors.gray200,
    dark: AppColors.gray600,
  );

  /// 3차 볼드 배경색
  static const AdaptiveColor backgroundTertiaryBold = AdaptiveColor(
    light: AppColors.gray300,
    dark: AppColors.gray500,
  );

  /// 브랜드 배경색
  static const AdaptiveColor backgroundBrand = AdaptiveColor(
    light: AppColors.primary500,
    dark: AppColors.primary600,
  );

  /// 브랜드 서브틀 배경색
  static const AdaptiveColor backgroundBrandSubtle = AdaptiveColor(
    light: AppColors.primary50,
    dark: AppColors.primary900,
  );

  /// 브랜드 볼드 배경색
  static const AdaptiveColor backgroundBrandBold = AdaptiveColor(
    light: AppColors.primary700,
    dark: AppColors.primary400,
  );

  /// 에러 배경색
  static const AdaptiveColor backgroundError = AdaptiveColor(
    light: AppColors.error500,
    dark: AppColors.error600,
  );

  /// 에러 서브틀 배경색
  static const AdaptiveColor backgroundErrorSubtle = AdaptiveColor(
    light: AppColors.error50,
    dark: AppColors.error900,
  );

  /// 에러 볼드 배경색
  static const AdaptiveColor backgroundErrorBold = AdaptiveColor(
    light: AppColors.error700,
    dark: AppColors.error400,
  );

  /// 성공 배경색
  static const AdaptiveColor backgroundSuccess = AdaptiveColor(
    light: AppColors.success500,
    dark: AppColors.success600,
  );

  /// 성공 서브틀 배경색
  static const AdaptiveColor backgroundSuccessSubtle = AdaptiveColor(
    light: AppColors.success50,
    dark: AppColors.success900,
  );

  /// 성공 볼드 배경색
  static const AdaptiveColor backgroundSuccessBold = AdaptiveColor(
    light: AppColors.success700,
    dark: AppColors.success400,
  );

  /// 경고 배경색
  static const AdaptiveColor backgroundWarning = AdaptiveColor(
    light: AppColors.warning500,
    dark: AppColors.warning600,
  );

  /// 경고 서브틀 배경색
  static const AdaptiveColor backgroundWarningSubtle = AdaptiveColor(
    light: AppColors.warning50,
    dark: AppColors.warning900,
  );

  /// 경고 볼드 배경색
  static const AdaptiveColor backgroundWarningBold = AdaptiveColor(
    light: AppColors.warning700,
    dark: AppColors.warning400,
  );

  /// 정보 배경색
  static const AdaptiveColor backgroundInfo = AdaptiveColor(
    light: AppColors.info500,
    dark: AppColors.info600,
  );

  /// 정보 서브틀 배경색
  static const AdaptiveColor backgroundInfoSubtle = AdaptiveColor(
    light: AppColors.info50,
    dark: AppColors.info900,
  );

  /// 정보 볼드 배경색
  static const AdaptiveColor backgroundInfoBold = AdaptiveColor(
    light: AppColors.info700,
    dark: AppColors.info400,
  );

  // ----------------- ICON COLORS -----------------

  /// 기본 아이콘 색상
  static const AdaptiveColor iconPrimary = AdaptiveColor(
    light: AppColors.gray700,
    dark: AppColors.gray300,
  );

  /// 보조 아이콘 색상
  static const AdaptiveColor iconSecondary = AdaptiveColor(
    light: AppColors.gray600,
    dark: AppColors.gray400,
  );

  /// 3차 아이콘 색상
  static const AdaptiveColor iconTertiary = AdaptiveColor(
    light: AppColors.gray500,
    dark: AppColors.gray500,
  );

  /// 비활성화된 아이콘
  static const AdaptiveColor iconDisabled = AdaptiveColor(
    light: AppColors.gray400,
    dark: AppColors.gray600,
  );

  /// 반전 아이콘
  static const AdaptiveColor iconInverse = AdaptiveColor(
    light: AppColors.white,
    dark: AppColors.black,
  );

  /// 브랜드 아이콘
  static const AdaptiveColor iconBrand = AdaptiveColor(
    light: AppColors.primary500,
    dark: AppColors.primary400,
  );

  /// 에러 아이콘
  static const AdaptiveColor iconError = AdaptiveColor(
    light: AppColors.error500,
    dark: AppColors.error400,
  );

  /// 성공 아이콘
  static const AdaptiveColor iconSuccess = AdaptiveColor(
    light: AppColors.success600,
    dark: AppColors.success400,
  );

  /// 경고 아이콘
  static const AdaptiveColor iconWarning = AdaptiveColor(
    light: AppColors.warning600,
    dark: AppColors.warning400,
  );

  /// 정보 아이콘
  static const AdaptiveColor iconInfo = AdaptiveColor(
    light: AppColors.info600,
    dark: AppColors.info400,
  );

  // ----------------- BORDER COLORS -----------------

  /// 기본 보더 색상
  static const AdaptiveColor borderPrimary = AdaptiveColor(
    light: AppColors.gray300,
    dark: AppColors.gray600,
  );

  /// 프라이머리 보더 색상 (검정 스케일)
  static const AdaptiveColor borderPrimaryScale = AdaptiveColor(
    light: AppColors.gray900,
    dark: AppColors.white,
  );

  /// 보조 보더 색상
  static const AdaptiveColor borderSecondary = AdaptiveColor(
    light: AppColors.gray200,
    dark: AppColors.gray700,
  );

  /// 3차 보더 색상
  static const AdaptiveColor borderTertiary = AdaptiveColor(
    light: AppColors.gray100,
    dark: AppColors.gray800,
  );

  /// 포커스 보더
  static const AdaptiveColor borderFocus = AdaptiveColor(
    light: AppColors.primary500,
    dark: AppColors.primary400,
  );

  /// 에러 보더
  static const AdaptiveColor borderError = AdaptiveColor(
    light: AppColors.error500,
    dark: AppColors.error400,
  );

  /// 성공 보더
  static const AdaptiveColor borderSuccess = AdaptiveColor(
    light: AppColors.success500,
    dark: AppColors.success400,
  );

  /// 경고 보더
  static const AdaptiveColor borderWarning = AdaptiveColor(
    light: AppColors.warning500,
    dark: AppColors.warning400,
  );

  /// 정보 보더
  static const AdaptiveColor borderInfo = AdaptiveColor(
    light: AppColors.info500,
    dark: AppColors.info400,
  );

  // ----------------- SPECIAL COLORS -----------------

  /// 그림자 색상
  static const AdaptiveColor shadow = AdaptiveColor(
    light: Color(0x1A000000),
    dark: Color(0x33000000),
  );

  /// 오버레이 색상
  static const AdaptiveColor overlay = AdaptiveColor(
    light: Color(0x80000000),
    dark: Color(0x80000000),
  );

  /// 디바이더 색상
  static const AdaptiveColor divider = AdaptiveColor(
    light: AppColors.gray200,
    dark: AppColors.gray700,
  );

  // ----------------- BOOKING STATUS COLORS -----------------

  /// 예약 대기 색상
  static const AdaptiveColor bookingPending = AdaptiveColor(
    light: AppColors.warning500,
    dark: AppColors.warning400,
  );

  /// 예약 확정 색상
  static const AdaptiveColor bookingConfirmed = AdaptiveColor(
    light: AppColors.success500,
    dark: AppColors.success400,
  );

  /// 예약 취소 색상
  static const AdaptiveColor bookingCancelled = AdaptiveColor(
    light: AppColors.error500,
    dark: AppColors.error400,
  );

  /// 예약 완료 색상
  static const AdaptiveColor bookingCompleted = AdaptiveColor(
    light: AppColors.gray500,
    dark: AppColors.gray400,
  );

  /// 결제 필요 색상
  static const AdaptiveColor paymentRequired = AdaptiveColor(
    light: AppColors.secondary500,
    dark: AppColors.secondary400,
  );

  // ----------------- RATING COLORS -----------------

  /// 평점 채워진 별
  static const AdaptiveColor ratingFilled = AdaptiveColor(
    light: AppColors.accent500,
    dark: AppColors.accent400,
  );

  /// 평점 빈 별
  static const AdaptiveColor ratingEmpty = AdaptiveColor(
    light: AppColors.gray300,
    dark: AppColors.gray600,
  );
}
