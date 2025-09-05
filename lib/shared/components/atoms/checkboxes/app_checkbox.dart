import 'package:flutter/material.dart';
import 'checkbox_size.dart';
import 'checkbox_color.dart';

/// 커스텀 체크박스
/// 
/// 3가지 크기와 다양한 색상을 지원하는 체크박스 컴포넌트
class AppCheckbox extends StatelessWidget {
  /// 체크박스 크기
  final CheckboxSize size;
  
  /// 체크박스 색상
  final CheckboxColor color;
  
  /// 체크 상태
  final bool value;
  
  /// 체크 상태 변경 콜백
  final ValueChanged<bool?>? onChanged;
  
  /// 활성화 여부
  final bool enabled;
  
  /// 라벨 텍스트
  final String? label;
  
  /// 라벨 스타일
  final TextStyle? labelStyle;
  
  /// 체크박스와 라벨 사이 간격
  final double spacing;

  const AppCheckbox({
    super.key,
    this.size = CheckboxSize.medium,
    this.color = CheckboxColor.primary,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.label,
    this.labelStyle,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = color.getColorScheme(context);
    final isEnabled = enabled && onChanged != null;
    
    Widget checkbox = GestureDetector(
      onTap: isEnabled ? () => onChanged?.call(!value) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size.size,
        height: size.size,
        decoration: BoxDecoration(
          color: _getBackgroundColor(colorScheme, isEnabled),
          border: Border.all(
            color: _getBorderColor(colorScheme, isEnabled),
            width: size.borderWidth,
          ),
          borderRadius: BorderRadius.circular(size.borderRadius),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: size.iconSize,
                color: _getIconColor(colorScheme, isEnabled),
              )
            : null,
      ),
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          checkbox,
          SizedBox(width: spacing),
          Flexible(
            child: GestureDetector(
              onTap: isEnabled ? () => onChanged?.call(!value) : null,
              child: Text(
                label!,
                style: labelStyle ?? _getDefaultLabelStyle(context, isEnabled),
              ),
            ),
          ),
        ],
      );
    }

    return checkbox;
  }

  Color _getBackgroundColor(CheckboxColorScheme colorScheme, bool isEnabled) {
    if (!isEnabled) {
      return colorScheme.disabledBackgroundColor;
    }
    return value 
        ? colorScheme.checkedBackgroundColor 
        : colorScheme.uncheckedBackgroundColor;
  }

  Color _getBorderColor(CheckboxColorScheme colorScheme, bool isEnabled) {
    if (!isEnabled) {
      return colorScheme.disabledBorderColor;
    }
    return value 
        ? colorScheme.checkedBorderColor 
        : colorScheme.uncheckedBorderColor;
  }

  Color _getIconColor(CheckboxColorScheme colorScheme, bool isEnabled) {
    if (!isEnabled) {
      return colorScheme.disabledIconColor;
    }
    return colorScheme.checkedIconColor;
  }

  TextStyle _getDefaultLabelStyle(BuildContext context, bool isEnabled) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium?.copyWith(
      color: isEnabled 
          ? theme.textTheme.bodyMedium?.color
          : theme.disabledColor,
    ) ?? const TextStyle();
  }
}

/// 체크박스 리스트 아이템
/// 
/// 체크박스와 함께 제목, 부제목을 표시할 수 있는 리스트 아이템
class AppCheckboxListTile extends StatelessWidget {
  /// 체크박스 크기
  final CheckboxSize size;
  
  /// 체크박스 색상
  final CheckboxColor color;
  
  /// 체크 상태
  final bool value;
  
  /// 체크 상태 변경 콜백
  final ValueChanged<bool?>? onChanged;
  
  /// 활성화 여부
  final bool enabled;
  
  /// 제목
  final String title;
  
  /// 부제목
  final String? subtitle;
  
  /// 제목 스타일
  final TextStyle? titleStyle;
  
  /// 부제목 스타일
  final TextStyle? subtitleStyle;
  
  /// 체크박스 위치 (leading 또는 trailing)
  final bool controlAffinity;
  
  /// 패딩
  final EdgeInsetsGeometry? contentPadding;

  const AppCheckboxListTile({
    super.key,
    this.size = CheckboxSize.medium,
    this.color = CheckboxColor.primary,
    required this.value,
    this.onChanged,
    this.enabled = true,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.controlAffinity = false, // false = leading, true = trailing
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final checkbox = AppCheckbox(
      size: size,
      color: color,
      value: value,
      onChanged: onChanged,
      enabled: enabled,
    );

    final titleWidget = Text(
      title,
      style: titleStyle ?? Theme.of(context).textTheme.bodyLarge,
    );

    final subtitleWidget = subtitle != null
        ? Text(
            subtitle!,
            style: subtitleStyle ?? Theme.of(context).textTheme.bodySmall,
          )
        : null;

    return InkWell(
      onTap: enabled && onChanged != null ? () => onChanged?.call(!value) : null,
      child: Padding(
        padding: contentPadding ?? const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            if (!controlAffinity) ...[
              checkbox,
              const SizedBox(width: 12.0),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  titleWidget,
                  if (subtitleWidget != null) ...[
                    const SizedBox(height: 2.0),
                    subtitleWidget,
                  ],
                ],
              ),
            ),
            if (controlAffinity) ...[
              const SizedBox(width: 12.0),
              checkbox,
            ],
          ],
        ),
      ),
    );
  }
}
