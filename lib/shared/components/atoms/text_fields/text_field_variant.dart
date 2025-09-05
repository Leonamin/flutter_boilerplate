import 'package:flutter/material.dart';

/// 텍스트 필드 스타일 variant 정의
enum TextFieldVariant {
  /// 박스 형태로 둘러싼 outline 스타일
  outline,
  
  /// 아래 밑줄 형태 스타일
  underline,
  
  /// 배경이 채워진 filled 스타일
  filled,
  
  /// 라벨이 박스 상단에 위치하는 labeled box 스타일
  labeledBox,
}

extension TextFieldVariantExtension on TextFieldVariant {
  /// variant에 따른 InputBorder 생성
  InputBorder getBorder({
    required Color borderColor,
    required double borderWidth,
    required double borderRadius,
  }) {
    switch (this) {
      case TextFieldVariant.outline:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        );
        
      case TextFieldVariant.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        );
        
      case TextFieldVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );
        
      case TextFieldVariant.labeledBox:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        );
    }
  }
  
  /// variant에 따른 배경색 필요 여부
  bool get needsBackgroundColor {
    switch (this) {
      case TextFieldVariant.outline:
      case TextFieldVariant.underline:
      case TextFieldVariant.labeledBox:
        return false;
      case TextFieldVariant.filled:
        return true;
    }
  }
  
  /// variant에 따른 라벨 위치
  bool get isFloatingLabel {
    switch (this) {
      case TextFieldVariant.outline:
      case TextFieldVariant.underline:
      case TextFieldVariant.filled:
        return true;
      case TextFieldVariant.labeledBox:
        return true; // labeledBox는 항상 floating
    }
  }
}
