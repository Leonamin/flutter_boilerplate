import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 기본 버튼 컴포넌트 (Atom)
/// 
/// 모든 버튼의 기본이 되는 최소한의 기능만 제공합니다.
/// - 탭 이벤트 처리
/// - 활성/비활성 상태
/// - 기본 스타일링
/// 
/// 복잡한 로직은 상위 컴포넌트에서 처리합니다.
class BaseButton extends StatefulWidget {
  const BaseButton({
    super.key,
    required this.child,
    this.onTap,
    this.enabled = true,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.pressedBackgroundColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.minHeight = 40.0,
    this.elevation = 0.0,
  });

  /// 버튼 내용
  final Widget child;
  
  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;
  
  /// 활성화 상태
  final bool enabled;
  
  /// 배경색
  final Color? backgroundColor;
  
  /// 전경색 (텍스트, 아이콘)
  final Color? foregroundColor;
  
  /// 테두리 색상
  final Color? borderColor;
  
  /// 눌렸을 때 배경색
  final Color? pressedBackgroundColor;
  
  /// 모서리 둥글기
  final double borderRadius;
  
  /// 내부 여백
  final EdgeInsets padding;
  
  /// 최소 높이
  final double minHeight;
  
  /// 그림자 높이
  final double elevation;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  bool _isPressed = false;

  bool get _isEnabled => widget.enabled && widget.onTap != null;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    // 기본 색상 설정
    final backgroundColor = widget.backgroundColor ?? colors.brand;
    final foregroundColor = widget.foregroundColor ?? Colors.white;
    final borderColor = widget.borderColor;
    
    // 상태별 색상 조정
    final currentBackgroundColor = _getCurrentBackgroundColor(
      backgroundColor, 
      colors,
    );
    final currentForegroundColor = _getCurrentForegroundColor(
      foregroundColor,
      colors,
    );

    return GestureDetector(
          onTap: _isEnabled ? widget.onTap : null,
          onTapDown: _isEnabled ? (_) => _setPressed(true) : null,
          onTapUp: _isEnabled ? (_) => _setPressed(false) : null,
          onTapCancel: _isEnabled ? () => _setPressed(false) : null,
          child: AnimatedContainer(
            duration: backgroundColor == Colors.transparent 
              ? Duration.zero 
              : const Duration(milliseconds: 150),
            constraints: BoxConstraints(minHeight: widget.minHeight),
            padding: widget.padding,
            decoration: BoxDecoration(
              color: currentBackgroundColor,
              border: borderColor != null 
                ? Border.all(color: borderColor) 
                : null,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: widget.elevation > 0 
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: widget.elevation,
                      offset: Offset(0, widget.elevation / 2),
                    ),
                  ]
                : null,
            ),
            child: DefaultTextStyle(
              style: TextStyle(color: currentForegroundColor),
              child: IconTheme(
                data: IconThemeData(color: currentForegroundColor),
                child: Center(child: widget.child),
              ),
            ),
          ),
        );
  }

  Color _getCurrentBackgroundColor(Color baseColor, dynamic colors) {
    if (!_isEnabled) {
      return colors.backgroundTertiary;
    }
    if (_isPressed) {
      // pressedBackgroundColor가 지정된 경우 우선 사용
      if (widget.pressedBackgroundColor != null) {
        return widget.pressedBackgroundColor!;
      }
    }
    return baseColor;
  }

  Color _getCurrentForegroundColor(Color baseColor, dynamic colors) {
    if (!_isEnabled) {
      return colors.textDisabled;
    }
    return baseColor;
  }
  void _setPressed(bool pressed) {
    if (mounted) {
      setState(() => _isPressed = pressed);
    }
  }
}
