import 'package:flutter/material.dart';

/// 칩 크기 정의
enum ChipSize {
  /// 소형 칩 (28px 높이)
  small,
  
  /// 중형 칩 (32px 높이)
  medium,
}

extension ChipSizeExtension on ChipSize {
  double get height {
    switch (this) {
      case ChipSize.small:
        return 28;
      case ChipSize.medium:
        return 32;
    }
  }
  
  EdgeInsets get padding {
    switch (this) {
      case ChipSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ChipSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }
  
  double get fontSize {
    switch (this) {
      case ChipSize.small:
        return 12;
      case ChipSize.medium:
        return 14;
    }
  }
  
  double get iconSize {
    switch (this) {
      case ChipSize.small:
        return 14;
      case ChipSize.medium:
        return 16;
    }
  }
  
  double get borderRadius {
    switch (this) {
      case ChipSize.small:
        return 14;
      case ChipSize.medium:
        return 16;
    }
  }
  
  double get iconSpacing {
    switch (this) {
      case ChipSize.small:
        return 4;
      case ChipSize.medium:
        return 6;
    }
  }
}
