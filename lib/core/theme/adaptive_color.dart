import 'package:flutter/material.dart';

/// 라이트/다크 테마에 따라 적응적으로 색상을 제공하는 클래스
class AdaptiveColor {
  final Color light;
  final Color dark;

  const AdaptiveColor({
    required this.light,
    required this.dark,
  });

  /// 현재 테마에 맞는 색상을 반환
  Color resolve(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? dark : light;
  }

  /// 특정 brightness에 맞는 색상을 반환
  Color resolveWith(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }

  /// 라이트 테마 색상만 사용하는 AdaptiveColor 생성
  factory AdaptiveColor.single(Color color) {
    return AdaptiveColor(light: color, dark: color);
  }

  /// 라이트 테마 전용 AdaptiveColor 생성
  factory AdaptiveColor.lightOnly(Color lightColor) {
    return AdaptiveColor(light: lightColor, dark: lightColor);
  }

  /// 다크 테마 전용 AdaptiveColor 생성  
  factory AdaptiveColor.darkOnly(Color darkColor) {
    return AdaptiveColor(light: darkColor, dark: darkColor);
  }
}
