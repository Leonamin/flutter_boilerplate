import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 뱃지 색상 타입 정의
enum BadgeColor {
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

/// 뱃지 색상 정보를 담는 클래스
class BadgeColorScheme {
  const BadgeColorScheme({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
}

extension BadgeColorExtension on BadgeColor {
  /// Filled 뱃지용 색상 스키마
  BadgeColorScheme getFilledColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case BadgeColor.brand:
        return BadgeColorScheme(
          backgroundColor: colors.brand,
          foregroundColor: Colors.white,
          borderColor: colors.brand,
        );
        
      case BadgeColor.secondary:
        return BadgeColorScheme(
          backgroundColor: colors.backgroundSecondary,
          foregroundColor: colors.textPrimary,
          borderColor: colors.backgroundSecondary,
        );
        
      case BadgeColor.tertiary:
        return BadgeColorScheme(
          backgroundColor: colors.backgroundTertiary,
          foregroundColor: colors.textSecondary,
          borderColor: colors.backgroundTertiary,
        );
        
      case BadgeColor.error:
        return BadgeColorScheme(
          backgroundColor: colors.backgroundError,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundError,
        );
        
      case BadgeColor.warning:
        return BadgeColorScheme(
          backgroundColor: colors.backgroundWarning,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundWarning,
        );
        
      case BadgeColor.info:
        return BadgeColorScheme(
          backgroundColor: colors.backgroundInfo,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundInfo,
        );
        
      case BadgeColor.success:
        return BadgeColorScheme(
          backgroundColor: colors.backgroundSuccess,
          foregroundColor: Colors.white,
          borderColor: colors.backgroundSuccess,
        );
    }
  }
  
  /// Outlined 뱃지용 색상 스키마
  BadgeColorScheme getOutlinedColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case BadgeColor.brand:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.brand,
          borderColor: colors.brand,
        );
        
      case BadgeColor.secondary:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textPrimary,
          borderColor: colors.borderPrimary,
        );
        
      case BadgeColor.tertiary:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSecondary,
          borderColor: colors.borderSecondary,
        );
        
      case BadgeColor.error:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textError,
          borderColor: colors.borderError,
        );
        
      case BadgeColor.warning:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textWarning,
          borderColor: colors.borderWarning,
        );
        
      case BadgeColor.info:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textInfo,
          borderColor: colors.borderInfo,
        );
        
      case BadgeColor.success:
        return BadgeColorScheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textSuccess,
          borderColor: colors.borderSuccess,
        );
    }
  }
}
