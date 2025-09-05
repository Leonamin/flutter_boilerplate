import 'package:flutter/material.dart';
import 'chip_color.dart';
import 'chip_size.dart';

/// 인터랙티브 칩 컴포넌트 (Atom)
///
/// 필터링, 카테고리 선택, 탭 선택 등에 사용되는 칩입니다.
/// 활성/비활성 상태를 가지며, 호버 효과를 지원합니다.
///
/// Example:
/// ```dart
/// AppChip(
///   text: 'Category',
///   isActive: true,
///   onTap: () => toggleCategory(),
/// )
/// 
/// AppChip(
///   text: 'Filter',
///   icon: Icons.filter_list,
///   color: ChipColor.brand,
///   size: ChipSize.medium,
///   isActive: false,
///   onTap: () => applyFilter(),
/// )
/// ```
class AppChip extends StatefulWidget {
  const AppChip({
    super.key,
    required this.text,
    this.icon,
    this.color = ChipColor.primary,
    this.size = ChipSize.medium,
    this.isActive = false,
    this.onTap,
  });

  /// 칩에 표시할 텍스트
  final String text;

  /// 선택적 아이콘 (텍스트 앞에 표시)
  final IconData? icon;

  /// 칩 색상
  final ChipColor color;

  /// 칩 크기
  final ChipSize size;

  /// 활성화 상태 (true: filled, false: outlined)
  final bool isActive;

  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;

  @override
  State<AppChip> createState() => _AppChipState();
}

class _AppChipState extends State<AppChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme(context);
    
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: widget.size.height,
          padding: widget.size.padding,
          decoration: BoxDecoration(
            color: _isHovered ? colorScheme.hoverBackgroundColor : colorScheme.backgroundColor,
            border: Border.all(
              color: _isHovered ? colorScheme.hoverBorderColor : colorScheme.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.size.borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: widget.size.iconSize,
                  color: _isHovered ? colorScheme.hoverForegroundColor : colorScheme.foregroundColor,
                ),
                SizedBox(width: widget.size.iconSpacing),
              ],
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.size.fontSize,
                  fontWeight: FontWeight.w500,
                  color: _isHovered ? colorScheme.hoverForegroundColor : colorScheme.foregroundColor,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ChipColorScheme _getColorScheme(BuildContext context) {
    return widget.isActive 
      ? widget.color.getActiveColorScheme(context)
      : widget.color.getInactiveColorScheme(context);
  }

  void _setHovered(bool hovered) {
    if (mounted) {
      setState(() => _isHovered = hovered);
    }
  }
}
