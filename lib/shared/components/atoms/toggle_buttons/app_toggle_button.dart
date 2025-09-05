import 'package:flutter/material.dart';
import 'toggle_button_size.dart';
import 'toggle_button_color.dart';

/// 커스텀 토글 버튼
class AppToggleButton extends StatefulWidget {
  const AppToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = ToggleButtonSize.medium,
    this.color = ToggleButtonColor.primary,
    this.enabled = true,
    this.label,
    this.labelStyle,
    this.spacing = 8.0,
  });

  /// 토글 버튼의 현재 값
  final bool value;

  /// 값이 변경될 때 호출되는 콜백
  final ValueChanged<bool>? onChanged;

  /// 토글 버튼 크기
  final ToggleButtonSize size;

  /// 토글 버튼 색상
  final ToggleButtonColor color;

  /// 활성화 여부
  final bool enabled;

  /// 라벨 텍스트
  final String? label;

  /// 라벨 텍스트 스타일
  final TextStyle? labelStyle;

  /// 라벨과 토글 버튼 사이의 간격
  final double spacing;

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _handleAnimation;
  Animation<Color?>? _trackColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _handleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(AppToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }

    if (oldWidget.color != widget.color) {
      _updateAnimations();
    }
  }

  void _updateAnimations() {
    final colorScheme = widget.color.getColorScheme(context);

    _trackColorAnimation = ColorTween(
      begin: widget.enabled
          ? colorScheme.inactiveTrackColor
          : colorScheme.disabledInactiveTrackColor,
      end: widget.enabled
          ? colorScheme.activeTrackColor
          : colorScheme.disabledActiveTrackColor,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.enabled || widget.onChanged == null) return;

    widget.onChanged!(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    // Initialize color animations on first build when context is available
    if (_trackColorAnimation == null) {
      _updateAnimations();
    }

    if (widget.label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton(),
          SizedBox(width: widget.spacing),
          GestureDetector(
            onTap: _handleTap,
            child: Text(
              widget.label!,
              style:
                  widget.labelStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: widget.enabled
                        ? null
                        : Theme.of(context).disabledColor,
                  ),
            ),
          ),
        ],
      );
    }

    return _buildToggleButton();
  }

  Widget _buildToggleButton() {
    final colorScheme = widget.color.getColorScheme(context);

    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final handleOffset =
              _handleAnimation.value *
              (widget.size.width -
                  widget.size.handleSize -
                  (widget.size.padding * 2));

          return Container(
            width: widget.size.width,
            height: widget.size.height,
            decoration: BoxDecoration(
              color: _trackColorAnimation?.value ?? Colors.grey,
              borderRadius: BorderRadius.circular(widget.size.borderRadius),
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.size.padding),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    left: handleOffset,
                    top: 0,
                    child: Container(
                      width: widget.size.handleSize,
                      height: widget.size.handleSize,
                      decoration: BoxDecoration(
                        color: widget.enabled
                            ? (widget.value
                                  ? colorScheme.activeHandleColor
                                  : colorScheme.inactiveHandleColor)
                            : (widget.value
                                  ? colorScheme.disabledActiveHandleColor
                                  : colorScheme.disabledInactiveHandleColor),
                        borderRadius: BorderRadius.circular(
                          widget.size.handleSize / 2,
                        ),
                        boxShadow: widget.enabled
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 토글 버튼 리스트 타일
class AppToggleButtonListTile extends StatelessWidget {
  const AppToggleButtonListTile({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.size = ToggleButtonSize.medium,
    this.color = ToggleButtonColor.primary,
    this.enabled = true,
    this.controlAffinity = ListTileControlAffinity.trailing,
    this.contentPadding,
  });

  /// 토글 버튼의 현재 값
  final bool value;

  /// 값이 변경될 때 호출되는 콜백
  final ValueChanged<bool>? onChanged;

  /// 제목
  final Widget? title;

  /// 부제목
  final Widget? subtitle;

  /// 토글 버튼 크기
  final ToggleButtonSize size;

  /// 토글 버튼 색상
  final ToggleButtonColor color;

  /// 활성화 여부
  final bool enabled;

  /// 토글 버튼 위치 (좌측 또는 우측)
  final ListTileControlAffinity controlAffinity;

  /// 내용 패딩
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final toggleButton = AppToggleButton(
      value: value,
      onChanged: enabled ? onChanged : null,
      size: size,
      color: color,
      enabled: enabled,
    );

    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: controlAffinity == ListTileControlAffinity.leading
          ? toggleButton
          : null,
      trailing: controlAffinity == ListTileControlAffinity.trailing
          ? toggleButton
          : null,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap: enabled && onChanged != null ? () => onChanged!(!value) : null,
    );
  }
}
