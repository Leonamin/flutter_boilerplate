import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/extensions/text_style_extension.dart';
import 'base_button.dart';
import 'button_variant.dart';
import 'button_color.dart';

/// 앱 전용 버튼 컴포넌트 (Atom)
///
/// BaseButton을 기반으로 앱의 디자인 시스템에 맞는 버튼을 제공합니다.
/// 기존 SolidButton의 복잡함을 제거하고 단순하게 재설계했습니다.
///
/// Example:
/// ```dart
/// AppButton(
///   '저장',
///   onTap: () => save(),
///   variant: ButtonVariant.filled,
///   size: ButtonSize.medium,
/// )
/// ```
class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    super.key,
    this.onTap,
    this.variant = ButtonVariant.filled,
    this.color = ButtonColor.brand,
    this.size = ButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.fullWidth = false,
  });

  /// Primary 버튼 (기본) - 호환성 유지
  const AppButton.primary(
    this.text, {
    super.key,
    this.onTap,
    this.size = ButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.fullWidth = false,
  }) : variant = ButtonVariant.filled,
       color = ButtonColor.brand;

  /// Secondary 버튼 (테두리) - 호환성 유지
  const AppButton.secondary(
    this.text, {
    super.key,
    this.onTap,
    this.size = ButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.fullWidth = false,
  }) : variant = ButtonVariant.outlined,
       color = ButtonColor.brand;

  /// Text 버튼 (텍스트만) - 호환성 유지
  const AppButton.text(
    this.text, {
    super.key,
    this.onTap,
    this.size = ButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.fullWidth = false,
  }) : variant = ButtonVariant.text,
       color = ButtonColor.brand;

  /// 버튼 텍스트
  final String text;

  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;

  /// 버튼 변형
  final ButtonVariant variant;

  /// 버튼 색상
  final ButtonColor color;

  /// 버튼 크기
  final ButtonSize size;

  /// 앞쪽 아이콘
  final IconData? leadingIcon;

  /// 뒤쪽 아이콘
  final IconData? trailingIcon;

  /// 활성화 상태
  final bool enabled;

  /// 전체 너비 사용 여부
  final bool fullWidth;


  @override
  Widget build(BuildContext context) {
    // 변형별 색상 설정
    final buttonColors = _getButtonColors(context);

    final content = _buildContent(context);

    final button = BaseButton(
      onTap: onTap,
      enabled: enabled,
      backgroundColor: buttonColors.backgroundColor,
      foregroundColor: buttonColors.foregroundColor,
      borderColor: buttonColors.borderColor,
      pressedBackgroundColor: buttonColors.pressedBackgroundColor,
      borderRadius: 8.0,
      padding: size.padding,
      minHeight: size.height,
      child: content,
    );

    // 단순한 버튼 - throttle/debounce는 로직 레벨에서 처리

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  Widget _buildContent(BuildContext context) {
    final children = <Widget>[];

    if (leadingIcon != null) {
      children.add(Icon(leadingIcon, size: size.iconSize));
      children.add(const SizedBox(width: 8));
    }

    children.add(
      Text(
        text,
        style: context.textStyles.body
            .copyWith(fontSize: size.fontSize)
            .semiBold,
      ),
    );

    if (trailingIcon != null) {
      children.add(const SizedBox(width: 8));
      children.add(Icon(trailingIcon, size: size.iconSize));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
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

/// 버튼 색상 정보를 담는 내부 클래스
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

