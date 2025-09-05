/// 텍스트 필드 크기 정의
enum TextFieldSize {
  /// 작은 크기 (32px)
  small,
  
  /// 중간 크기 (40px) - 기본값
  medium,
  
  /// 큰 크기 (48px)
  large,
}

extension TextFieldSizeExtension on TextFieldSize {
  /// 크기에 따른 높이 값
  double get height {
    switch (this) {
      case TextFieldSize.small:
        return 32.0;
      case TextFieldSize.medium:
        return 40.0;
      case TextFieldSize.large:
        return 48.0;
    }
  }
  
  /// 크기에 따른 수평 패딩 값
  double get horizontalPadding {
    switch (this) {
      case TextFieldSize.small:
        return 8.0;
      case TextFieldSize.medium:
        return 12.0;
      case TextFieldSize.large:
        return 16.0;
    }
  }
  
  /// 크기에 따른 수직 패딩 값 (높이 조절용)
  double get verticalPadding {
    switch (this) {
      case TextFieldSize.small:
        return 6.0;
      case TextFieldSize.medium:
        return 8.0;
      case TextFieldSize.large:
        return 12.0;
    }
  }
  
  /// 크기에 따른 폰트 크기
  double get fontSize {
    switch (this) {
      case TextFieldSize.small:
        return 12.0;
      case TextFieldSize.medium:
        return 14.0;
      case TextFieldSize.large:
        return 16.0;
    }
  }
  
  /// 크기에 따른 아이콘 크기
  double get iconSize {
    switch (this) {
      case TextFieldSize.small:
        return 16.0;
      case TextFieldSize.medium:
        return 20.0;
      case TextFieldSize.large:
        return 24.0;
    }
  }
  
  /// 크기에 따른 border radius
  double get borderRadius {
    switch (this) {
      case TextFieldSize.small:
        return 4.0;
      case TextFieldSize.medium:
        return 6.0;
      case TextFieldSize.large:
        return 8.0;
    }
  }
  
  /// 크기에 따른 border width
  double get borderWidth {
    switch (this) {
      case TextFieldSize.small:
        return 1.0;
      case TextFieldSize.medium:
        return 1.0;
      case TextFieldSize.large:
        return 1.5;
    }
  }
}
