import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_color.dart';
import 'base_button.dart';
import 'button_variant.dart';

/// 아이콘 버튼 컴포넌트 (Atom)
///
/// 아이콘만 표시하는 단순한 버튼입니다.
///
/// Example:
/// ```dart
/// AppIconButton(
///   Icons.favorite,
///   onTap: () => toggleFavorite(),
///   size: ButtonSize.medium,
/// )
/// ```
class AppIconButton extends StatelessWidget {
  const AppIconButton(
    this.icon, {
    super.key,
    this.onTap,
    this.size = ButtonSize.medium,
    this.color = ButtonColor.brand,
    this.variant = ButtonVariant.icon,
    this.enabled = true,
    this.tooltip,
  });

  /// 표시할 아이콘
  final IconData icon;

  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;

  /// 버튼 크기
  final ButtonSize size;

  /// 버튼 색상
  final ButtonColor color;

  /// 버튼 변형
  final ButtonVariant variant;

  /// 활성화 상태
  final bool enabled;

  /// 툴팁 텍스트
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final buttonColors = _getButtonColors(context);

    final button = BaseButton(
      onTap: onTap,
      enabled: enabled,
      backgroundColor: buttonColors.backgroundColor,
      foregroundColor: buttonColors.foregroundColor,
      pressedBackgroundColor: buttonColors.pressedBackgroundColor,
      borderColor: buttonColors.borderColor,
      borderRadius: size == ButtonSize.small ? 4.0 : 8.0,
      padding: EdgeInsets.all(size.padding.horizontal / 2),
      minHeight: size.height,
      child: Icon(icon, size: size.iconSize),
    );

    return tooltip != null ? Tooltip(message: tooltip!, child: button) : button;
  }

  _ButtonColors _getButtonColors(BuildContext context) {
    switch (variant) {
      case ButtonVariant.filled:
        final colorScheme = color.getFilledColorScheme(context);
        return _ButtonColors(
          backgroundColor: colorScheme.backgroundColor,
          foregroundColor: colorScheme.foregroundColor,
          borderColor: null,
          pressedBackgroundColor: colorScheme.hoverBackgroundColor,
        );

      case ButtonVariant.outlined:
        final colorScheme = color.getOutlinedColorScheme(context);
        return _ButtonColors(
          backgroundColor: colorScheme.backgroundColor,
          foregroundColor: colorScheme.foregroundColor,
          borderColor: colorScheme.borderColor,
          pressedBackgroundColor: colorScheme.hoverBackgroundColor,
        );

      case ButtonVariant.text:
        final colorScheme = color.getTextColorScheme(context);
        return _ButtonColors(
          backgroundColor: colorScheme.backgroundColor,
          foregroundColor: colorScheme.foregroundColor,
          borderColor: null,
          pressedBackgroundColor: colorScheme.hoverBackgroundColor,
        );

      case ButtonVariant.icon:
        final colorScheme = color.getTextColorScheme(context);
        return _ButtonColors(
          backgroundColor: colorScheme.backgroundColor,
          foregroundColor: colorScheme.foregroundColor,
          borderColor: null,
          pressedBackgroundColor: colorScheme.hoverBackgroundColor,
        );
    }
  }
}

class _ButtonColors {
  const _ButtonColors({
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.pressedBackgroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final Color? pressedBackgroundColor;
}
