import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 칩 색상 타입 정의
enum ChipColor {
  /// 프라이머리 색상 (검정 스케일)
  primary,
  
  /// 주요 브랜드 색상
  brand,
  
  /// 보조 색상
  secondary,
  
  /// 3차 색상 (회색 계열)
  tertiary,
  
  /// 에러/위험 색상
  error,
  
  /// 경고 색상
  warning,
  
  /// 정보 색상
  info,
  
  /// 성공 색상
  success,
}

/// 칩 색상 정보를 담는 클래스
class ChipColorScheme {
  const ChipColorScheme({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.hoverBackgroundColor,
    required this.hoverForegroundColor,
    required this.hoverBorderColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color hoverBackgroundColor;
  final Color hoverForegroundColor;
  final Color hoverBorderColor;
}

extension ChipColorExtension on ChipColor {
  /// Active (Filled) 칩용 색상 스키마
  ChipColorScheme getActiveColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case ChipColor.primary:
        return ChipColorScheme(
          backgroundColor: colors.textPrimary,
          foregroundColor: colors.backgroundPrimary,
          borderColor: colors.textPrimary,
          hoverBackgroundColor: colors.textSecondary,
          hoverForegroundColor: colors.backgroundPrimary,
          hoverBorderColor: colors.textSecondary,
        );
        
      case ChipColor.brand:
        return ChipColorScheme(
          backgroundColor: colors.brand,
          foregroundColor: Colors.white,
          borderColor: colors.brand,
          hoverBackgroundColor: colors.backgroundBrandBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundBrandBold,
        );
        
      case ChipColor.secondary:
        return ChipColorScheme(
          backgroundColor: colors.backgroundSecondary,
          foregroundColor: colors.textPrimary,
          borderColor: colors.backgroundSecondary,
          hoverBackgroundColor: colors.backgroundSecondaryBold,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.backgroundSecondaryBold,
        );
        
      case ChipColor.tertiary:
        return ChipColorScheme(
          backgroundColor: colors.backgroundTertiary,
          foregroundColor: colors.textSecondary,
          borderColor: colors.backgroundTertiary,
          hoverBackgroundColor: colors.backgroundTertiaryBold,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.backgroundTertiaryBold,
        );
        
      case ChipColor.error:
        return ChipColorScheme(
          backgroundColor: colors.backgroundError,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundError,
          hoverBackgroundColor: colors.backgroundErrorBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundErrorBold,
        );
        
      case ChipColor.warning:
        return ChipColorScheme(
          backgroundColor: colors.backgroundWarning,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundWarning,
          hoverBackgroundColor: colors.backgroundWarningBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundWarningBold,
        );
        
      case ChipColor.info:
        return ChipColorScheme(
          backgroundColor: colors.backgroundInfo,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundInfo,
          hoverBackgroundColor: colors.backgroundInfoBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundInfoBold,
        );
        
      case ChipColor.success:
        return ChipColorScheme(
          backgroundColor: colors.backgroundSuccess,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundSuccess,
          hoverBackgroundColor: colors.backgroundSuccessBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundSuccessBold,
        );
    }
  }
  
  /// Inactive (Outlined) 칩용 색상 스키마
  ChipColorScheme getInactiveColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case ChipColor.primary:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textPrimary,
          borderColor: colors.borderPrimary,
          hoverBackgroundColor: colors.backgroundSecondary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.borderPrimary,
        );
        
      case ChipColor.brand:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.brand,
          borderColor: colors.brand,
          hoverBackgroundColor: colors.brandSubtle,
          hoverForegroundColor: colors.brand,
          hoverBorderColor: colors.brand,
        );
        
      case ChipColor.secondary:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textPrimary,
          borderColor: colors.borderPrimary,
          hoverBackgroundColor: colors.backgroundSecondary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.borderPrimary,
        );
        
      case ChipColor.tertiary:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSecondary,
          borderColor: colors.borderSecondary,
          hoverBackgroundColor: colors.backgroundTertiary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.borderPrimary,
        );
        
      case ChipColor.error:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textError,
          borderColor: colors.borderError,
          hoverBackgroundColor: colors.backgroundErrorSubtle,
          hoverForegroundColor: colors.textError,
          hoverBorderColor: colors.borderError,
        );
        
      case ChipColor.warning:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textWarning,
          borderColor: colors.borderWarning,
          hoverBackgroundColor: colors.backgroundWarningSubtle,
          hoverForegroundColor: colors.textWarning,
          hoverBorderColor: colors.borderWarning,
        );
        
      case ChipColor.info:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textInfo,
          borderColor: colors.borderInfo,
          hoverBackgroundColor: colors.backgroundInfoSubtle,
          hoverForegroundColor: colors.textInfo,
          hoverBorderColor: colors.borderInfo,
        );
        
      case ChipColor.success:
        return ChipColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSuccess,
          borderColor: colors.borderSuccess,
          hoverBackgroundColor: colors.backgroundSuccessSubtle,
          hoverForegroundColor: colors.textSuccess,
          hoverBorderColor: colors.borderSuccess,
        );
    }
  }
}
