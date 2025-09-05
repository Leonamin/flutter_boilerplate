/// 체크박스 크기 정의
enum CheckboxSize {
  /// 작은 크기 (16px)
  small,
  
  /// 중간 크기 (20px) - 기본값
  medium,
  
  /// 큰 크기 (24px)
  large,
}

extension CheckboxSizeExtension on CheckboxSize {
  /// 크기에 따른 체크박스 크기 값
  double get size {
    switch (this) {
      case CheckboxSize.small:
        return 16.0;
      case CheckboxSize.medium:
        return 20.0;
      case CheckboxSize.large:
        return 24.0;
    }
  }
  
  /// 크기에 따른 체크 아이콘 크기
  double get iconSize {
    switch (this) {
      case CheckboxSize.small:
        return 12.0;
      case CheckboxSize.medium:
        return 16.0;
      case CheckboxSize.large:
        return 18.0;
    }
  }
  
  /// 크기에 따른 border radius
  double get borderRadius {
    switch (this) {
      case CheckboxSize.small:
        return 2.0;
      case CheckboxSize.medium:
        return 3.0;
      case CheckboxSize.large:
        return 4.0;
    }
  }
  
  /// 크기에 따른 border width
  double get borderWidth {
    switch (this) {
      case CheckboxSize.small:
        return 1.0;
      case CheckboxSize.medium:
        return 1.5;
      case CheckboxSize.large:
        return 2.0;
    }
  }
}
