import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/extensions/text_style_extension.dart';

/// Throttle이 적용된 버튼 컴포넌트
/// 
/// 지정된 시간 간격 내에서는 첫 번째 탭만 처리하고,
/// 나머지 탭은 무시하여 중복 실행을 방지합니다.
/// 
/// Example:
/// ```dart
/// ThrottledButton(
///   '저장',
///   onTap: () => saveData(),
///   throttleDuration: Duration(milliseconds: 1000),
/// )
/// ```
class ThrottledButton extends StatefulWidget {
  /// 버튼에 표시될 텍스트
  final String text;
  
  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;
  
  /// Throttle 지속 시간 (기본값: 500ms)
  final Duration throttleDuration;
  
  /// 버튼 스타일
  final ButtonStyle? style;
  
  /// 로딩 상태 표시 여부
  final bool showLoadingOnThrottle;
  
  /// 비활성화 상태
  final bool enabled;

  const ThrottledButton(
    this.text, {
    super.key,
    this.onTap,
    this.throttleDuration = const Duration(milliseconds: 500),
    this.style,
    this.showLoadingOnThrottle = false,
    this.enabled = true,
  });

  @override
  State<ThrottledButton> createState() => _ThrottledButtonState();
}

class _ThrottledButtonState extends State<ThrottledButton> {
  Timer? _throttleTimer;
  bool _isThrottled = false;

  @override
  void dispose() {
    _throttleTimer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.enabled || _isThrottled || widget.onTap == null) {
      return;
    }

    // 첫 번째 탭 실행
    widget.onTap!();

    // Throttle 상태 활성화
    setState(() {
      _isThrottled = true;
    });

    // 지정된 시간 후 throttle 해제
    _throttleTimer?.cancel();
    _throttleTimer = Timer(widget.throttleDuration, () {
      if (mounted) {
        setState(() {
          _isThrottled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.enabled || _isThrottled;
    
    return ElevatedButton(
      onPressed: isDisabled ? null : _handleTap,
      style: widget.style ?? _getDefaultStyle(context, isDisabled),
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    if (widget.showLoadingOnThrottle && _isThrottled) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(widget.text),
        ],
      );
    }

    return Text(widget.text);
  }

  ButtonStyle _getDefaultStyle(BuildContext context, bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: isDisabled 
        ? context.colors.backgroundTertiary 
        : context.colors.brand,
      foregroundColor: isDisabled 
        ? context.colors.textDisabled 
        : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: context.textStyles.body.semiBold,
    );
  }
}
