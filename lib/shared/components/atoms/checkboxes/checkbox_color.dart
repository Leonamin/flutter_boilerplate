import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 체크박스 색상 타입 정의
enum CheckboxColor {
  /// 기본 색상 (검정 스케일)
  primary,
  
  /// 브랜드 색상
  brand,
  
  /// 성공 색상 (초록색)
  success,
  
  /// 에러 색상 (빨간색)
  error,
  
  /// 경고 색상 (노란색)
  warning,
  
  /// 정보 색상 (파란색)
  info,
}

/// 체크박스 상태별 색상 스키마
class CheckboxColorScheme {
  /// 체크된 상태 배경색
  final Color checkedBackgroundColor;
  
  /// 체크된 상태 체크 아이콘 색상
  final Color checkedIconColor;
  
  /// 체크된 상태 테두리 색상
  final Color checkedBorderColor;
  
  /// 체크되지 않은 상태 배경색
  final Color uncheckedBackgroundColor;
  
  /// 체크되지 않은 상태 테두리 색상
  final Color uncheckedBorderColor;
  
  /// 비활성화 상태 배경색
  final Color disabledBackgroundColor;
  
  /// 비활성화 상태 체크 아이콘 색상
  final Color disabledIconColor;
  
  /// 비활성화 상태 테두리 색상
  final Color disabledBorderColor;

  const CheckboxColorScheme({
    required this.checkedBackgroundColor,
    required this.checkedIconColor,
    required this.checkedBorderColor,
    required this.uncheckedBackgroundColor,
    required this.uncheckedBorderColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.disabledBorderColor,
  });
}

extension CheckboxColorExtension on CheckboxColor {
  /// 색상 타입에 따른 색상 스키마 반환
  CheckboxColorScheme getColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case CheckboxColor.primary:
        return CheckboxColorScheme(
          checkedBackgroundColor: colors.textPrimary,
          checkedIconColor: colors.backgroundPrimary,
          checkedBorderColor: colors.textPrimary,
          uncheckedBackgroundColor: Colors.transparent,
          uncheckedBorderColor: colors.borderPrimary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledIconColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
        );
        
      case CheckboxColor.brand:
        return CheckboxColorScheme(
          checkedBackgroundColor: colors.brand,
          checkedIconColor: Colors.white,
          checkedBorderColor: colors.brand,
          uncheckedBackgroundColor: Colors.transparent,
          uncheckedBorderColor: colors.borderPrimary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledIconColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
        );
        
      case CheckboxColor.success:
        return CheckboxColorScheme(
          checkedBackgroundColor: colors.backgroundSuccess,
          checkedIconColor: Colors.white,
          checkedBorderColor: colors.backgroundSuccess,
          uncheckedBackgroundColor: Colors.transparent,
          uncheckedBorderColor: colors.borderPrimary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledIconColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
        );
        
      case CheckboxColor.error:
        return CheckboxColorScheme(
          checkedBackgroundColor: colors.backgroundError,
          checkedIconColor: Colors.white,
          checkedBorderColor: colors.backgroundError,
          uncheckedBackgroundColor: Colors.transparent,
          uncheckedBorderColor: colors.borderPrimary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledIconColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
        );
        
      case CheckboxColor.warning:
        return CheckboxColorScheme(
          checkedBackgroundColor: colors.backgroundWarning,
          checkedIconColor: Colors.white,
          checkedBorderColor: colors.backgroundWarning,
          uncheckedBackgroundColor: Colors.transparent,
          uncheckedBorderColor: colors.borderPrimary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledIconColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
        );
        
      case CheckboxColor.info:
        return CheckboxColorScheme(
          checkedBackgroundColor: colors.backgroundInfo,
          checkedIconColor: Colors.white,
          checkedBorderColor: colors.backgroundInfo,
          uncheckedBackgroundColor: Colors.transparent,
          uncheckedBorderColor: colors.borderPrimary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledIconColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
        );
    }
  }
}
