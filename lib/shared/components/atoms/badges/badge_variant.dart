import 'package:flutter/material.dart';

/// 뱃지 변형 타입 정의
enum BadgeVariant {
  /// 배경이 채워진 뱃지
  filled,
  
  /// 테두리만 있는 뱃지
  outlined,
}

/// 뱃지 크기 정의
enum BadgeSize {
  /// 16px 높이
  tiny,
  
  /// 20px 높이
  small,
  
  /// 24px 높이
  medium,
  
  /// 28px 높이
  large,
  
  /// 32px 높이
  extraLarge,
}

extension BadgeSizeExtension on BadgeSize {
  double get height {
    switch (this) {
      case BadgeSize.tiny:
        return 16;
      case BadgeSize.small:
        return 20;
      case BadgeSize.medium:
        return 24;
      case BadgeSize.large:
        return 28;
      case BadgeSize.extraLarge:
        return 32;
    }
  }
  
  EdgeInsets get padding {
    switch (this) {
      case BadgeSize.tiny:
        return const EdgeInsets.symmetric(horizontal: 4, vertical: 2);
      case BadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 6, vertical: 2);
      case BadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case BadgeSize.large:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 4);
      case BadgeSize.extraLarge:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    }
  }
  
  double get fontSize {
    switch (this) {
      case BadgeSize.tiny:
        return 10;
      case BadgeSize.small:
        return 11;
      case BadgeSize.medium:
        return 12;
      case BadgeSize.large:
        return 13;
      case BadgeSize.extraLarge:
        return 14;
    }
  }
  
  double get iconSize {
    switch (this) {
      case BadgeSize.tiny:
        return 10;
      case BadgeSize.small:
        return 12;
      case BadgeSize.medium:
        return 14;
      case BadgeSize.large:
        return 16;
      case BadgeSize.extraLarge:
        return 18;
    }
  }
  
  double get borderRadius {
    switch (this) {
      case BadgeSize.tiny:
        return 8;
      case BadgeSize.small:
        return 10;
      case BadgeSize.medium:
        return 12;
      case BadgeSize.large:
        return 14;
      case BadgeSize.extraLarge:
        return 16;
    }
  }
  
  double get iconSpacing {
    switch (this) {
      case BadgeSize.tiny:
        return 2;
      case BadgeSize.small:
        return 3;
      case BadgeSize.medium:
        return 4;
      case BadgeSize.large:
        return 4;
      case BadgeSize.extraLarge:
        return 5;
    }
  }
}
