import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 라디오 버튼 색상 타입 정의
enum RadioButtonColor {
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

/// 라디오 버튼 상태별 색상 스키마
class RadioButtonColorScheme {
  /// 선택된 상태 내부 원 색상
  final Color selectedInnerColor;
  
  /// 선택된 상태 테두리 색상
  final Color selectedBorderColor;
  
  /// 선택되지 않은 상태 배경색
  final Color unselectedBackgroundColor;
  
  /// 선택되지 않은 상태 테두리 색상
  final Color unselectedBorderColor;
  
  /// 비활성화 상태 내부 원 색상
  final Color disabledInnerColor;
  
  /// 비활성화 상태 테두리 색상
  final Color disabledBorderColor;
  
  /// 비활성화 상태 배경색
  final Color disabledBackgroundColor;

  const RadioButtonColorScheme({
    required this.selectedInnerColor,
    required this.selectedBorderColor,
    required this.unselectedBackgroundColor,
    required this.unselectedBorderColor,
    required this.disabledInnerColor,
    required this.disabledBorderColor,
    required this.disabledBackgroundColor,
  });
}

extension RadioButtonColorExtension on RadioButtonColor {
  /// 색상 타입에 따른 색상 스키마 반환
  RadioButtonColorScheme getColorScheme(BuildContext context) {
    final colors = context.colors;
    
    switch (this) {
      case RadioButtonColor.primary:
        return RadioButtonColorScheme(
          selectedInnerColor: colors.textPrimary,
          selectedBorderColor: colors.textPrimary,
          unselectedBackgroundColor: Colors.transparent,
          unselectedBorderColor: colors.borderPrimary,
          disabledInnerColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
        );
        
      case RadioButtonColor.brand:
        return RadioButtonColorScheme(
          selectedInnerColor: colors.brand,
          selectedBorderColor: colors.brand,
          unselectedBackgroundColor: Colors.transparent,
          unselectedBorderColor: colors.borderPrimary,
          disabledInnerColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
        );
        
      case RadioButtonColor.success:
        return RadioButtonColorScheme(
          selectedInnerColor: colors.backgroundSuccess,
          selectedBorderColor: colors.backgroundSuccess,
          unselectedBackgroundColor: Colors.transparent,
          unselectedBorderColor: colors.borderPrimary,
          disabledInnerColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
        );
        
      case RadioButtonColor.error:
        return RadioButtonColorScheme(
          selectedInnerColor: colors.backgroundError,
          selectedBorderColor: colors.backgroundError,
          unselectedBackgroundColor: Colors.transparent,
          unselectedBorderColor: colors.borderPrimary,
          disabledInnerColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
        );
        
      case RadioButtonColor.warning:
        return RadioButtonColorScheme(
          selectedInnerColor: colors.backgroundWarning,
          selectedBorderColor: colors.backgroundWarning,
          unselectedBackgroundColor: Colors.transparent,
          unselectedBorderColor: colors.borderPrimary,
          disabledInnerColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
        );
        
      case RadioButtonColor.info:
        return RadioButtonColorScheme(
          selectedInnerColor: colors.backgroundInfo,
          selectedBorderColor: colors.backgroundInfo,
          unselectedBackgroundColor: Colors.transparent,
          unselectedBorderColor: colors.borderPrimary,
          disabledInnerColor: colors.iconDisabled,
          disabledBorderColor: colors.borderSecondary,
          disabledBackgroundColor: colors.backgroundSecondary,
        );
    }
  }
}
