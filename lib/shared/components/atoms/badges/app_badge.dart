import 'package:flutter/material.dart';
import 'badge_color.dart';
import 'badge_variant.dart';

/// 뱃지 컴포넌트 (Atom)
///
/// 텍스트나 아이콘과 함께 정보를 표시하는 뱃지입니다.
/// 태그, 상태 표시, 카테고리 등에 사용됩니다.
///
/// Example:
/// ```dart
/// AppBadge(
///   text: 'New',
///   color: BadgeColor.brand,
///   size: BadgeSize.medium,
/// )
/// 
/// AppBadge(
///   text: 'Featured',
///   icon: Icons.star,
///   color: BadgeColor.success,
///   variant: BadgeVariant.outlined,
/// )
/// ```
class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.text,
    this.icon,
    this.color = BadgeColor.brand,
    this.variant = BadgeVariant.filled,
    this.size = BadgeSize.medium,
  });

  /// 뱃지에 표시할 텍스트
  final String text;

  /// 선택적 아이콘 (텍스트 앞에 표시)
  final IconData? icon;

  /// 뱃지 색상
  final BadgeColor color;

  /// 뱃지 변형 (filled/outlined)
  final BadgeVariant variant;

  /// 뱃지 크기
  final BadgeSize size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme(context);
    
    return Container(
      height: size.height,
      padding: size.padding,
      decoration: BoxDecoration(
        color: colorScheme.backgroundColor,
        border: variant == BadgeVariant.outlined 
          ? Border.all(color: colorScheme.borderColor, width: 1)
          : null,
        borderRadius: BorderRadius.circular(size.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: size.iconSize,
              color: colorScheme.foregroundColor,
            ),
            SizedBox(width: size.iconSpacing),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: size.fontSize,
              fontWeight: FontWeight.w500,
              color: colorScheme.foregroundColor,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  BadgeColorScheme _getColorScheme(BuildContext context) {
    switch (variant) {
      case BadgeVariant.filled:
        return color.getFilledColorScheme(context);
      case BadgeVariant.outlined:
        return color.getOutlinedColorScheme(context);
    }
  }
}
