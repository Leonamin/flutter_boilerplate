import 'package:flutter/material.dart';

/// TextStyle 확장으로 스타일 변형을 쉽게 적용
extension TextStyleExtension on TextStyle {
  /// Bold 스타일 적용
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Semi-bold 스타일 적용
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Medium 스타일 적용
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Regular 스타일 적용
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Light 스타일 적용
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Italic 스타일 적용
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Underline 적용
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Line-through 적용
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Overline 적용
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// 데코레이션 제거
  TextStyle get noDecoration => copyWith(decoration: TextDecoration.none);

  /// 특정 색상 적용
  TextStyle withColor(Color color) => copyWith(color: color);

  /// 특정 폰트 크기 적용
  TextStyle withSize(double size) => copyWith(fontSize: size);

  /// 특정 라인 하이트 적용
  TextStyle withHeight(double height) => copyWith(height: height);

  /// 특정 letter spacing 적용
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  /// 특정 font weight 적용
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  /// 투명도 적용
  TextStyle withOpacity(double opacity) {
    final color = this.color ?? Colors.black;
    return copyWith(color: color.withValues(alpha: opacity));
  }

  /// 그림자 효과 적용
  TextStyle withShadow({
    Color color = Colors.black26,
    Offset offset = const Offset(0, 1),
    double blurRadius = 2.0,
  }) {
    return copyWith(
      shadows: [Shadow(color: color, offset: offset, blurRadius: blurRadius)],
    );
  }

  /// 여러 그림자 효과 적용
  TextStyle withShadows(List<Shadow> shadows) {
    return copyWith(shadows: shadows);
  }

  /// 폰트 패밀리 변경
  TextStyle withFontFamily(String fontFamily) {
    return copyWith(fontFamily: fontFamily);
  }

  /// 조합 스타일들

  /// Bold + Italic
  TextStyle get boldItalic => bold.italic;

  /// Bold + Underline
  TextStyle get boldUnderline => bold.underline;

  /// Italic + Underline
  TextStyle get italicUnderline => italic.underline;

  /// Bold + Italic + Underline
  TextStyle get boldItalicUnderline => bold.italic.underline;
}
