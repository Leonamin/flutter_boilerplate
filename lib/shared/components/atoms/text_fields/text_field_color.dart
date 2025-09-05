import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 텍스트 필드 색상 타입 정의
enum TextFieldColor {
  /// 기본 색상 (검정 스케일)
  primary,
  
  /// 에러 색상 (빨간색)
  error,
}

/// 텍스트 필드 상태별 색상 스키마
class TextFieldColorScheme {
  /// 일반 상태 색상
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color hintColor;
  final Color labelColor;
  final Color iconColor;
  
  /// 포커스 상태 색상
  final Color focusedBorderColor;
  final Color focusedBackgroundColor;
  final Color focusedTextColor;
  final Color focusedLabelColor;
  final Color focusedIconColor;
  
  /// 에러 상태 색상
  final Color errorBorderColor;
  final Color errorBackgroundColor;
  final Color errorTextColor;
  final Color errorLabelColor;
  final Color errorIconColor;
  
  /// 비활성화 상태 색상
  final Color disabledBorderColor;
  final Color disabledBackgroundColor;
  final Color disabledTextColor;
  final Color disabledLabelColor;
  final Color disabledIconColor;

  const TextFieldColorScheme({
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    required this.hintColor,
    required this.labelColor,
    required this.iconColor,
    required this.focusedBorderColor,
    required this.focusedBackgroundColor,
    required this.focusedTextColor,
    required this.focusedLabelColor,
    required this.focusedIconColor,
    required this.errorBorderColor,
    required this.errorBackgroundColor,
    required this.errorTextColor,
    required this.errorLabelColor,
    required this.errorIconColor,
    required this.disabledBorderColor,
    required this.disabledBackgroundColor,
    required this.disabledTextColor,
    required this.disabledLabelColor,
    required this.disabledIconColor,
  });
}

extension TextFieldColorExtension on TextFieldColor {
  /// 색상 타입에 따른 색상 스키마 반환
  TextFieldColorScheme getColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case TextFieldColor.primary:
        return TextFieldColorScheme(
          // 일반 상태
          borderColor: colors.borderPrimary,
          backgroundColor: colors.backgroundPrimary,
          textColor: colors.textPrimary,
          hintColor: colors.textSecondary,
          labelColor: colors.textSecondary,
          iconColor: colors.iconSecondary,
          
          // 포커스 상태
          focusedBorderColor: colors.borderFocus,
          focusedBackgroundColor: colors.backgroundPrimary,
          focusedTextColor: colors.textPrimary,
          focusedLabelColor: colors.brand,
          focusedIconColor: colors.iconPrimary,
          
          // 에러 상태
          errorBorderColor: colors.borderError,
          errorBackgroundColor: colors.backgroundPrimary,
          errorTextColor: colors.textPrimary,
          errorLabelColor: colors.textError,
          errorIconColor: colors.iconError,
          
          // 비활성화 상태
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledTextColor: colors.textDisabled,
          disabledLabelColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
        );
        
      case TextFieldColor.error:
        return TextFieldColorScheme(
          // 일반 상태 (에러 색상 기본 적용)
          borderColor: colors.borderError,
          backgroundColor: colors.backgroundPrimary,
          textColor: colors.textPrimary,
          hintColor: colors.textSecondary,
          labelColor: colors.textError,
          iconColor: colors.iconError,
          
          // 포커스 상태
          focusedBorderColor: colors.borderError,
          focusedBackgroundColor: colors.backgroundPrimary,
          focusedTextColor: colors.textPrimary,
          focusedLabelColor: colors.textError,
          focusedIconColor: colors.iconError,
          
          // 에러 상태 (동일)
          errorBorderColor: colors.borderError,
          errorBackgroundColor: colors.backgroundPrimary,
          errorTextColor: colors.textPrimary,
          errorLabelColor: colors.textError,
          errorIconColor: colors.iconError,
          
          // 비활성화 상태
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
          disabledTextColor: colors.textDisabled,
          disabledLabelColor: colors.textDisabled,
          disabledIconColor: colors.iconDisabled,
        );
    }
  }
}
