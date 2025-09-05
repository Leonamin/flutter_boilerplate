import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 드롭다운 색상 정의
enum DropdownColor {
  /// 기본 색상 (검은색 계열)
  primary,
  
  /// 브랜드 색상
  brand,
  
  /// 에러 색상 (빨간색)
  error,
  
  /// 성공 색상 (초록색)
  success,
  
  /// 경고 색상 (주황색)
  warning,
  
  /// 정보 색상 (파란색)
  info,
}

/// 드롭다운 색상 스키마
class DropdownColorScheme {
  const DropdownColorScheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.textColor,
    required this.hintTextColor,
    required this.iconColor,
    required this.disabledBackgroundColor,
    required this.disabledBorderColor,
    required this.disabledTextColor,
    required this.disabledIconColor,
    required this.dropdownBackgroundColor,
    required this.dropdownBorderColor,
    required this.itemHoverColor,
    required this.itemSelectedColor,
  });

  /// 배경 색상
  final Color backgroundColor;
  
  /// 테두리 색상
  final Color borderColor;
  
  /// 포커스된 테두리 색상
  final Color focusedBorderColor;
  
  /// 텍스트 색상
  final Color textColor;
  
  /// 힌트 텍스트 색상
  final Color hintTextColor;
  
  /// 아이콘 색상
  final Color iconColor;
  
  /// 비활성화된 배경 색상
  final Color disabledBackgroundColor;
  
  /// 비활성화된 테두리 색상
  final Color disabledBorderColor;
  
  /// 비활성화된 텍스트 색상
  final Color disabledTextColor;
  
  /// 비활성화된 아이콘 색상
  final Color disabledIconColor;
  
  /// 드롭다운 메뉴 배경 색상
  final Color dropdownBackgroundColor;
  
  /// 드롭다운 메뉴 테두리 색상
  final Color dropdownBorderColor;
  
  /// 아이템 호버 색상
  final Color itemHoverColor;
  
  /// 선택된 아이템 색상
  final Color itemSelectedColor;
}

extension DropdownColorExtension on DropdownColor {
  /// 색상에 따른 드롭다운 색상 스키마 반환
  DropdownColorScheme getColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case DropdownColor.primary:
        return DropdownColorScheme(
          backgroundColor: colors.backgroundPrimary,
          borderColor: colors.borderPrimary,
          focusedBorderColor: colors.textPrimary,
          textColor: colors.textPrimary,
          hintTextColor: colors.textTertiary,
          iconColor: colors.iconSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledBorderColor: colors.borderSecondary,
          disabledTextColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
          dropdownBackgroundColor: colors.backgroundPrimary,
          dropdownBorderColor: colors.borderPrimary,
          itemHoverColor: colors.backgroundSecondary,
          itemSelectedColor: colors.backgroundTertiary,
        );
        
      case DropdownColor.brand:
        return DropdownColorScheme(
          backgroundColor: colors.backgroundPrimary,
          borderColor: colors.borderPrimary,
          focusedBorderColor: colors.brand,
          textColor: colors.textPrimary,
          hintTextColor: colors.textTertiary,
          iconColor: colors.iconBrand,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledBorderColor: colors.borderSecondary,
          disabledTextColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
          dropdownBackgroundColor: colors.backgroundPrimary,
          dropdownBorderColor: colors.brand,
          itemHoverColor: colors.backgroundBrandSubtle,
          itemSelectedColor: colors.backgroundBrandSubtle,
        );
        
      case DropdownColor.error:
        return DropdownColorScheme(
          backgroundColor: colors.backgroundPrimary,
          borderColor: colors.borderError,
          focusedBorderColor: colors.backgroundError,
          textColor: colors.textPrimary,
          hintTextColor: colors.textTertiary,
          iconColor: colors.iconError,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledBorderColor: colors.borderSecondary,
          disabledTextColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
          dropdownBackgroundColor: colors.backgroundPrimary,
          dropdownBorderColor: colors.borderError,
          itemHoverColor: colors.backgroundErrorSubtle,
          itemSelectedColor: colors.backgroundErrorSubtle,
        );
        
      case DropdownColor.success:
        return DropdownColorScheme(
          backgroundColor: colors.backgroundPrimary,
          borderColor: colors.borderPrimary,
          focusedBorderColor: colors.backgroundSuccess,
          textColor: colors.textPrimary,
          hintTextColor: colors.textTertiary,
          iconColor: colors.iconSuccess,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledBorderColor: colors.borderSecondary,
          disabledTextColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
          dropdownBackgroundColor: colors.backgroundPrimary,
          dropdownBorderColor: colors.borderSuccess,
          itemHoverColor: colors.backgroundSuccessSubtle,
          itemSelectedColor: colors.backgroundSuccessSubtle,
        );
        
      case DropdownColor.warning:
        return DropdownColorScheme(
          backgroundColor: colors.backgroundPrimary,
          borderColor: colors.borderPrimary,
          focusedBorderColor: colors.backgroundWarning,
          textColor: colors.textPrimary,
          hintTextColor: colors.textTertiary,
          iconColor: colors.iconWarning,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledBorderColor: colors.borderSecondary,
          disabledTextColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
          dropdownBackgroundColor: colors.backgroundPrimary,
          dropdownBorderColor: colors.borderWarning,
          itemHoverColor: colors.backgroundWarningSubtle,
          itemSelectedColor: colors.backgroundWarningSubtle,
        );
        
      case DropdownColor.info:
        return DropdownColorScheme(
          backgroundColor: colors.backgroundPrimary,
          borderColor: colors.borderPrimary,
          focusedBorderColor: colors.backgroundInfo,
          textColor: colors.textPrimary,
          hintTextColor: colors.textTertiary,
          iconColor: colors.iconInfo,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledBorderColor: colors.borderSecondary,
          disabledTextColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
          dropdownBackgroundColor: colors.backgroundPrimary,
          dropdownBorderColor: colors.borderInfo,
          itemHoverColor: colors.backgroundInfoSubtle,
          itemSelectedColor: colors.backgroundInfoSubtle,
        );
    }
  }
}
