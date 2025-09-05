/// 라디오 버튼 크기 정의
enum RadioButtonSize {
  /// 작은 크기 (16px)
  small,
  
  /// 중간 크기 (20px) - 기본값
  medium,
  
  /// 큰 크기 (24px)
  large,
}

extension RadioButtonSizeExtension on RadioButtonSize {
  /// 크기에 따른 라디오 버튼 크기 값
  double get size {
    switch (this) {
      case RadioButtonSize.small:
        return 16.0;
      case RadioButtonSize.medium:
        return 20.0;
      case RadioButtonSize.large:
        return 24.0;
    }
  }
  
  /// 크기에 따른 내부 원 크기
  double get innerCircleSize {
    switch (this) {
      case RadioButtonSize.small:
        return 6.0;
      case RadioButtonSize.medium:
        return 8.0;
      case RadioButtonSize.large:
        return 10.0;
    }
  }
  
  /// 크기에 따른 border width
  double get borderWidth {
    switch (this) {
      case RadioButtonSize.small:
        return 1.0;
      case RadioButtonSize.medium:
        return 1.5;
      case RadioButtonSize.large:
        return 2.0;
    }
  }
}
