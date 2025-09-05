import 'package:flutter/material.dart';

/// 드롭다운 크기 정의
enum DropdownSize {
  /// 작은 크기 (높이 40px)
  small,
  
  /// 중간 크기 (높이 48px) - 기본값
  medium,
  
  /// 큰 크기 (높이 56px)
  large,
}

extension DropdownSizeExtension on DropdownSize {
  /// 크기에 따른 드롭다운 높이
  double get height {
    switch (this) {
      case DropdownSize.small:
        return 40.0;
      case DropdownSize.medium:
        return 48.0;
      case DropdownSize.large:
        return 56.0;
    }
  }
  
  /// 크기에 따른 패딩
  EdgeInsets get padding {
    switch (this) {
      case DropdownSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case DropdownSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case DropdownSize.large:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
    }
  }
  
  /// 크기에 따른 아이콘 크기
  double get iconSize {
    switch (this) {
      case DropdownSize.small:
        return 16.0;
      case DropdownSize.medium:
        return 20.0;
      case DropdownSize.large:
        return 24.0;
    }
  }
  
  /// 크기에 따른 텍스트 스타일 크기
  double get fontSize {
    switch (this) {
      case DropdownSize.small:
        return 14.0;
      case DropdownSize.medium:
        return 16.0;
      case DropdownSize.large:
        return 18.0;
    }
  }
  
  /// 크기에 따른 border radius
  double get borderRadius {
    switch (this) {
      case DropdownSize.small:
        return 6.0;
      case DropdownSize.medium:
        return 8.0;
      case DropdownSize.large:
        return 10.0;
    }
  }
}
