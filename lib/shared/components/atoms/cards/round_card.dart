import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 둥근 모서리와 그림자를 가진 기본 카드 컴포넌트 (Atom)
///
/// 내용물의 크기에 따라 자동으로 크기가 조절되는 카드입니다.
/// - borderRadius: 모서리 둥글기 조절
/// - borderColor: 테두리 색상
/// - padding: 내부 여백
/// - backgroundColor: 배경색
class RoundCard extends StatelessWidget {
  const RoundCard({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(16.0),
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  });

  /// 카드 내용물
  final Widget child;

  /// 모서리 둥글기 (기본값: 12.0)
  final double borderRadius;

  /// 테두리 색상
  final Color? borderColor;

  /// 내부 여백 (기본값: EdgeInsets.all(16.0))
  final EdgeInsetsGeometry padding;

  /// 배경색 (기본값: Theme의 cardColor)
  final Color? backgroundColor;

  /// 고정 너비 (선택사항, 지정하지 않으면 내용물에 맞춤)
  final double? width;

  /// 고정 높이 (선택사항, 지정하지 않으면 내용물에 맞춤)
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor ?? context.colors.borderPrimary),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
