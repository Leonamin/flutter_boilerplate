import 'package:flutter/material.dart';
import 'radio_button_size.dart';
import 'radio_button_color.dart';

/// 커스텀 라디오 버튼
/// 
/// 3가지 크기와 다양한 색상을 지원하는 라디오 버튼 컴포넌트
class AppRadioButton<T> extends StatelessWidget {
  /// 라디오 버튼 크기
  final RadioButtonSize size;
  
  /// 라디오 버튼 색상
  final RadioButtonColor color;
  
  /// 현재 값
  final T value;
  
  /// 그룹 값
  final T? groupValue;
  
  /// 값 변경 콜백
  final ValueChanged<T?>? onChanged;
  
  /// 활성화 여부
  final bool enabled;
  
  /// 라벨 텍스트
  final String? label;
  
  /// 라벨 스타일
  final TextStyle? labelStyle;
  
  /// 라디오 버튼과 라벨 사이 간격
  final double spacing;

  const AppRadioButton({
    super.key,
    this.size = RadioButtonSize.medium,
    this.color = RadioButtonColor.primary,
    required this.value,
    required this.groupValue,
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
    final isSelected = value == groupValue;
    
    Widget radioButton = GestureDetector(
      onTap: isEnabled ? () => onChanged?.call(value) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size.size,
        height: size.size,
        decoration: BoxDecoration(
          color: _getBackgroundColor(colorScheme, isEnabled, isSelected),
          border: Border.all(
            color: _getBorderColor(colorScheme, isEnabled, isSelected),
            width: size.borderWidth,
          ),
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: size.innerCircleSize,
                  height: size.innerCircleSize,
                  decoration: BoxDecoration(
                    color: _getInnerCircleColor(colorScheme, isEnabled),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null,
      ),
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          radioButton,
          SizedBox(width: spacing),
          Flexible(
            child: GestureDetector(
              onTap: isEnabled ? () => onChanged?.call(value) : null,
              child: Text(
                label!,
                style: labelStyle ?? _getDefaultLabelStyle(context, isEnabled),
              ),
            ),
          ),
        ],
      );
    }

    return radioButton;
  }

  Color _getBackgroundColor(RadioButtonColorScheme colorScheme, bool isEnabled, bool isSelected) {
    if (!isEnabled) {
      return colorScheme.disabledBackgroundColor;
    }
    return colorScheme.unselectedBackgroundColor;
  }

  Color _getBorderColor(RadioButtonColorScheme colorScheme, bool isEnabled, bool isSelected) {
    if (!isEnabled) {
      return colorScheme.disabledBorderColor;
    }
    return isSelected 
        ? colorScheme.selectedBorderColor 
        : colorScheme.unselectedBorderColor;
  }

  Color _getInnerCircleColor(RadioButtonColorScheme colorScheme, bool isEnabled) {
    if (!isEnabled) {
      return colorScheme.disabledInnerColor;
    }
    return colorScheme.selectedInnerColor;
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

/// 라디오 버튼 리스트 아이템
/// 
/// 라디오 버튼과 함께 제목, 부제목을 표시할 수 있는 리스트 아이템
class AppRadioButtonListTile<T> extends StatelessWidget {
  /// 라디오 버튼 크기
  final RadioButtonSize size;
  
  /// 라디오 버튼 색상
  final RadioButtonColor color;
  
  /// 현재 값
  final T value;
  
  /// 그룹 값
  final T? groupValue;
  
  /// 값 변경 콜백
  final ValueChanged<T?>? onChanged;
  
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
  
  /// 라디오 버튼 위치 (leading 또는 trailing)
  final bool controlAffinity;
  
  /// 패딩
  final EdgeInsetsGeometry? contentPadding;

  const AppRadioButtonListTile({
    super.key,
    this.size = RadioButtonSize.medium,
    this.color = RadioButtonColor.primary,
    required this.value,
    required this.groupValue,
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
    final radioButton = AppRadioButton<T>(
      size: size,
      color: color,
      value: value,
      groupValue: groupValue,
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
      onTap: enabled && onChanged != null ? () => onChanged?.call(value) : null,
      child: Padding(
        padding: contentPadding ?? const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            if (!controlAffinity) ...[
              radioButton,
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
              radioButton,
            ],
          ],
        ),
      ),
    );
  }
}

/// 라디오 버튼 그룹
/// 
/// 여러 라디오 버튼을 그룹으로 관리하는 위젯
class AppRadioButtonGroup<T> extends StatelessWidget {
  /// 라디오 버튼 크기
  final RadioButtonSize size;
  
  /// 라디오 버튼 색상
  final RadioButtonColor color;
  
  /// 옵션 리스트
  final List<RadioButtonOption<T>> options;
  
  /// 현재 선택된 값
  final T? groupValue;
  
  /// 값 변경 콜백
  final ValueChanged<T?>? onChanged;
  
  /// 활성화 여부
  final bool enabled;
  
  /// 방향 (세로/가로)
  final Axis direction;
  
  /// 간격
  final double spacing;
  
  /// 패딩
  final EdgeInsetsGeometry? padding;

  const AppRadioButtonGroup({
    super.key,
    this.size = RadioButtonSize.medium,
    this.color = RadioButtonColor.primary,
    required this.options,
    this.groupValue,
    this.onChanged,
    this.enabled = true,
    this.direction = Axis.vertical,
    this.spacing = 8.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final children = options.map((option) {
      return AppRadioButton<T>(
        size: size,
        color: color,
        value: option.value,
        groupValue: groupValue,
        onChanged: enabled ? onChanged : null,
        enabled: enabled && option.enabled,
        label: option.label,
        labelStyle: option.labelStyle,
      );
    }).toList();

    Widget content;
    if (direction == Axis.vertical) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children
            .expand((child) => [child, SizedBox(height: spacing)])
            .take(children.length * 2 - 1)
            .toList(),
      );
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: children
            .expand((child) => [child, SizedBox(width: spacing)])
            .take(children.length * 2 - 1)
            .toList(),
      );
    }

    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    return content;
  }
}

/// 라디오 버튼 옵션 데이터 클래스
class RadioButtonOption<T> {
  /// 값
  final T value;
  
  /// 라벨
  final String label;
  
  /// 활성화 여부
  final bool enabled;
  
  /// 라벨 스타일
  final TextStyle? labelStyle;

  const RadioButtonOption({
    required this.value,
    required this.label,
    this.enabled = true,
    this.labelStyle,
  });
}
