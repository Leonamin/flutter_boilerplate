import 'package:flutter/material.dart';

/// 버튼 변형 타입 정의 (색상과 독립적)
enum ButtonVariant {
  /// 배경이 채워진 버튼
  filled,
  
  /// 테두리만 있는 버튼
  outlined,
  
  /// 텍스트만 있는 버튼 (배경/테두리 없음)
  text,
  
  /// 아이콘만 있는 버튼
  icon,
}

/// 버튼 크기 정의
enum ButtonSize {
  /// 24px 높이
  small,
  
  /// 32px 높이
  medium,
  
  /// 40px 높이
  large,
  
  /// 48px 높이
  extraLarge,
}

extension ButtonSizeExtension on ButtonSize {
  double get height {
    switch (this) {
      case ButtonSize.small:
        return 24;
      case ButtonSize.medium:
        return 32;
      case ButtonSize.large:
        return 40;
      case ButtonSize.extraLarge:
        return 48;
    }
  }
  
  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.extraLarge:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
    }
  }
  
  double get fontSize {
    switch (this) {
      case ButtonSize.small:
        return 12;
      case ButtonSize.medium:
        return 14;
      case ButtonSize.large:
        return 16;
      case ButtonSize.extraLarge:
        return 18;
    }
  }
  
  double get iconSize {
    switch (this) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 18;
      case ButtonSize.large:
        return 20;
      case ButtonSize.extraLarge:
        return 24;
    }
  }
}
