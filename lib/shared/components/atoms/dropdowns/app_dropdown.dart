import 'package:flutter/material.dart';
import 'dropdown_size.dart';
import 'dropdown_color.dart';

/// 드롭다운 아이템 모델
class DropdownItem<T> {
  const DropdownItem({
    required this.value,
    required this.label,
    this.icon,
    this.enabled = true,
  });

  /// 아이템 값
  final T value;

  /// 표시될 라벨
  final String label;

  /// 아이템 아이콘 (선택사항)
  final Widget? icon;

  /// 활성화 여부
  final bool enabled;
}

/// 커스텀 드롭다운 (기본 DropdownButton 기반)
class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint,
    this.size = DropdownSize.medium,
    this.color = DropdownColor.primary,
    this.enabled = true,
    this.label,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxHeight = 200.0,
  });

  /// 드롭다운 아이템 목록
  final List<DropdownItem<T>> items;

  /// 값이 변경될 때 호출되는 콜백
  final ValueChanged<T?>? onChanged;

  /// 현재 선택된 값
  final T? value;

  /// 힌트 텍스트
  final String? hint;

  /// 드롭다운 크기
  final DropdownSize size;

  /// 드롭다운 색상
  final DropdownColor color;

  /// 활성화 여부
  final bool enabled;

  /// 라벨 텍스트
  final String? label;

  /// 헬퍼 텍스트
  final String? helperText;

  /// 에러 텍스트
  final String? errorText;

  /// 좌측 아이콘
  final Widget? prefixIcon;

  /// 우측 아이콘 (기본 드롭다운 아이콘 대체)
  final Widget? suffixIcon;

  /// 드롭다운 메뉴 최대 높이
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = color.getColorScheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: size.fontSize - 2,
              fontWeight: FontWeight.w500,
              color: enabled
                  ? colorScheme.textColor
                  : colorScheme.disabledTextColor,
            ),
          ),
          const SizedBox(height: 6.0),
        ],
        Container(
          height: size.height,
          decoration: BoxDecoration(
            color: enabled
                ? colorScheme.backgroundColor
                : colorScheme.disabledBackgroundColor,
            borderRadius: BorderRadius.circular(size.borderRadius),
            border: Border.all(
              color: errorText != null
                  ? colorScheme.focusedBorderColor
                  : (enabled
                        ? colorScheme.borderColor
                        : colorScheme.disabledBorderColor),
              width: 1.0,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              items: items.map<DropdownMenuItem<T>>((DropdownItem<T> item) {
                return DropdownMenuItem<T>(
                  value: item.value,
                  enabled: item.enabled,
                  child: Row(
                    children: [
                      if (item.icon != null) ...[
                        item.icon!,
                        const SizedBox(width: 8.0),
                      ],
                      Expanded(
                        child: Text(
                          item.label,
                          style: TextStyle(
                            fontSize: size.fontSize,
                            color: item.enabled
                                ? colorScheme.textColor
                                : colorScheme.disabledTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: enabled ? onChanged : null,
              hint: hint != null
                  ? Row(
                      children: [
                        if (prefixIcon != null) ...[
                          prefixIcon!,
                          const SizedBox(width: 8.0),
                        ],
                        Expanded(
                          child: Text(
                            hint!,
                            style: TextStyle(
                              fontSize: size.fontSize,
                              color: enabled
                                  ? colorScheme.hintTextColor
                                  : colorScheme.disabledTextColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((DropdownItem<T> item) {
                  return Row(
                    children: [
                      if (prefixIcon != null) ...[
                        prefixIcon!,
                        const SizedBox(width: 8.0),
                      ],
                      if (item.icon != null) ...[
                        item.icon!,
                        const SizedBox(width: 8.0),
                      ],
                      Expanded(
                        child: Text(
                          item.label,
                          style: TextStyle(
                            fontSize: size.fontSize,
                            color: enabled
                                ? colorScheme.textColor
                                : colorScheme.disabledTextColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
              icon: suffixIcon ??
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: size.iconSize,
                    color: enabled
                        ? colorScheme.iconColor
                        : colorScheme.disabledIconColor,
                  ),
              iconSize: size.iconSize,
              isExpanded: true,
              menuMaxHeight: maxHeight,
              dropdownColor: colorScheme.dropdownBackgroundColor,
              focusColor: Colors.transparent,
              borderRadius: BorderRadius.circular(size.borderRadius),
              padding: size.padding,
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4.0),
          Text(
            errorText!,
            style: TextStyle(
              fontSize: size.fontSize - 2,
              color: colorScheme.focusedBorderColor,
            ),
          ),
        ] else if (helperText != null) ...[
          const SizedBox(height: 4.0),
          Text(
            helperText!,
            style: TextStyle(
              fontSize: size.fontSize - 2,
              color: colorScheme.hintTextColor,
            ),
          ),
        ],
      ],
    );
  }
}
