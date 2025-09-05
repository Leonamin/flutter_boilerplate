/// 토글 버튼 크기 정의
enum ToggleButtonSize {
  /// 작은 크기 (40x24px)
  small,
  
  /// 중간 크기 (48x28px) - 기본값
  medium,
  
  /// 큰 크기 (56x32px)
  large,
}

extension ToggleButtonSizeExtension on ToggleButtonSize {
  /// 크기에 따른 토글 버튼 너비
  double get width {
    switch (this) {
      case ToggleButtonSize.small:
        return 40.0;
      case ToggleButtonSize.medium:
        return 48.0;
      case ToggleButtonSize.large:
        return 56.0;
    }
  }
  
  /// 크기에 따른 토글 버튼 높이
  double get height {
    switch (this) {
      case ToggleButtonSize.small:
        return 24.0;
      case ToggleButtonSize.medium:
        return 28.0;
      case ToggleButtonSize.large:
        return 32.0;
    }
  }
  
  /// 크기에 따른 토글 핸들 크기
  double get handleSize {
    switch (this) {
      case ToggleButtonSize.small:
        return 20.0;
      case ToggleButtonSize.medium:
        return 24.0;
      case ToggleButtonSize.large:
        return 28.0;
    }
  }
  
  /// 크기에 따른 패딩
  double get padding {
    switch (this) {
      case ToggleButtonSize.small:
        return 2.0;
      case ToggleButtonSize.medium:
        return 2.0;
      case ToggleButtonSize.large:
        return 2.0;
    }
  }
  
  /// 크기에 따른 border radius
  double get borderRadius {
    switch (this) {
      case ToggleButtonSize.small:
        return 12.0;
      case ToggleButtonSize.medium:
        return 14.0;
      case ToggleButtonSize.large:
        return 16.0;
    }
  }
}
