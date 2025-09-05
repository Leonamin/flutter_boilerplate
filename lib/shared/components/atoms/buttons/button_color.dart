import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 버튼 색상 타입 정의
enum ButtonColor {
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

/// 버튼 색상 정보를 담는 클래스
class ButtonColorScheme {
  const ButtonColorScheme({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.hoverBackgroundColor,
    required this.hoverForegroundColor,
    required this.hoverBorderColor,
    required this.disabledBackgroundColor,
    required this.disabledForegroundColor,
    required this.disabledBorderColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final Color hoverBackgroundColor;
  final Color hoverForegroundColor;
  final Color hoverBorderColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final Color disabledBorderColor;
}

extension ButtonColorExtension on ButtonColor {
  /// Filled 버튼용 색상 스키마
  ButtonColorScheme getFilledColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case ButtonColor.brand:
        return ButtonColorScheme(
          backgroundColor: colors.brand,
          foregroundColor: Colors.white,
          borderColor: colors.brand,
          hoverBackgroundColor: colors.backgroundBrandBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundBrandBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
        
      case ButtonColor.secondary:
        return ButtonColorScheme(
          backgroundColor: colors.backgroundSecondary,
          foregroundColor: colors.textPrimary,
          borderColor: colors.backgroundSecondary,
          hoverBackgroundColor: colors.backgroundSecondaryBold,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.backgroundSecondaryBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
        
      case ButtonColor.tertiary:
        return ButtonColorScheme(
          backgroundColor: colors.backgroundTertiary,
          foregroundColor: colors.textSecondary,
          borderColor: colors.backgroundTertiary,
          hoverBackgroundColor: colors.backgroundTertiaryBold,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.backgroundTertiaryBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
        
      case ButtonColor.error:
        return ButtonColorScheme(
          backgroundColor: colors.backgroundError,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundError,
          hoverBackgroundColor: colors.backgroundErrorBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundErrorBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
        
      case ButtonColor.warning:
        return ButtonColorScheme(
          backgroundColor: colors.backgroundWarning,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundWarning,
          hoverBackgroundColor: colors.backgroundWarningBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundWarningBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
        
      case ButtonColor.info:
        return ButtonColorScheme(
          backgroundColor: colors.backgroundInfo,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundInfo,
          hoverBackgroundColor: colors.backgroundInfoBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundInfoBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
        
      case ButtonColor.success:
        return ButtonColorScheme(
          backgroundColor: colors.backgroundSuccess,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundSuccess,
          hoverBackgroundColor: colors.backgroundSuccessBold,
          hoverForegroundColor: Colors.white,
          hoverBorderColor: colors.backgroundSuccessBold,
          disabledBackgroundColor: colors.backgroundTertiary,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.backgroundTertiary,
        );
    }
  }
  
  /// Outlined 버튼용 색상 스키마
  ButtonColorScheme getOutlinedColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case ButtonColor.brand:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.brand,
          borderColor: colors.brand,
          hoverBackgroundColor: colors.brandSubtle,
          hoverForegroundColor: colors.brand,
          hoverBorderColor: colors.brand,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
        
      case ButtonColor.secondary:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textPrimary,
          borderColor: colors.borderPrimary,
          hoverBackgroundColor: colors.backgroundSecondary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.borderPrimary,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
        
      case ButtonColor.tertiary:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSecondary,
          borderColor: colors.borderSecondary,
          hoverBackgroundColor: colors.backgroundTertiary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: colors.borderPrimary,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
        
      case ButtonColor.error:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textError,
          borderColor: colors.borderError,
          hoverBackgroundColor: colors.backgroundErrorSubtle,
          hoverForegroundColor: colors.textError,
          hoverBorderColor: colors.borderError,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
        
      case ButtonColor.warning:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textWarning,
          borderColor: colors.borderWarning,
          hoverBackgroundColor: colors.backgroundWarningSubtle,
          hoverForegroundColor: colors.textWarning,
          hoverBorderColor: colors.borderWarning,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
        
      case ButtonColor.info:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textInfo,
          borderColor: colors.borderInfo,
          hoverBackgroundColor: colors.backgroundInfoSubtle,
          hoverForegroundColor: colors.textInfo,
          hoverBorderColor: colors.borderInfo,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
        
      case ButtonColor.success:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSuccess,
          borderColor: colors.borderSuccess,
          hoverBackgroundColor: colors.backgroundSuccessSubtle,
          hoverForegroundColor: colors.textSuccess,
          hoverBorderColor: colors.borderSuccess,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: colors.borderTertiary,
        );
    }
  }
  
  /// Text 버튼용 색상 스키마
  ButtonColorScheme getTextColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case ButtonColor.brand:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.brand,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.brandSubtle,
          hoverForegroundColor: colors.brand,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
        
      case ButtonColor.secondary:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textPrimary,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.backgroundSecondary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
        
      case ButtonColor.tertiary:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSecondary,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.backgroundTertiary,
          hoverForegroundColor: colors.textPrimary,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
        
      case ButtonColor.error:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textError,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.backgroundErrorSubtle,
          hoverForegroundColor: colors.textError,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
        
      case ButtonColor.warning:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textWarning,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.backgroundWarningSubtle,
          hoverForegroundColor: colors.textWarning,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
        
      case ButtonColor.info:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textInfo,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.backgroundInfoSubtle,
          hoverForegroundColor: colors.textInfo,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
        
      case ButtonColor.success:
        return ButtonColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSuccess,
          borderColor: Colors.transparent,
          hoverBackgroundColor: colors.backgroundSuccessSubtle,
          hoverForegroundColor: colors.textSuccess,
          hoverBorderColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          disabledBorderColor: Colors.transparent,
        );
    }
  }
}
