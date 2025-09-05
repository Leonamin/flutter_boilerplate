import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/extensions/text_style_extension.dart';

/// Debounce가 적용된 버튼 컴포넌트
/// 
/// 연속된 탭 이벤트에서 마지막 탭만 처리하여
/// 불필요한 중복 실행을 방지합니다.
/// 검색, 자동완성 등에 유용합니다.
/// 
/// Example:
/// ```dart
/// DebouncedButton(
///   '검색',
///   onTap: () => performSearch(),
///   debounceDuration: Duration(milliseconds: 300),
/// )
/// ```
class DebouncedButton extends StatefulWidget {
  /// 버튼에 표시될 텍스트
  final String text;
  
  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;
  
  /// Debounce 지속 시간 (기본값: 300ms)
  final Duration debounceDuration;
  
  /// 버튼 스타일
  final ButtonStyle? style;
  
  /// 대기 중 로딩 표시 여부
  final bool showLoadingOnDebounce;
  
  /// 비활성화 상태
  final bool enabled;

  const DebouncedButton(
    this.text, {
    super.key,
    this.onTap,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.style,
    this.showLoadingOnDebounce = false,
    this.enabled = true,
  });

  @override
  State<DebouncedButton> createState() => _DebouncedButtonState();
}

class _DebouncedButtonState extends State<DebouncedButton> {
  Timer? _debounceTimer;
  bool _isWaiting = false;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.enabled || widget.onTap == null) {
      return;
    }

    // 이전 타이머 취소
    _debounceTimer?.cancel();

    // 대기 상태 표시
    if (widget.showLoadingOnDebounce && !_isWaiting) {
      setState(() {
        _isWaiting = true;
      });
    }

    // 새로운 타이머 시작
    _debounceTimer = Timer(widget.debounceDuration, () {
      if (mounted) {
        // 실제 함수 실행
        widget.onTap!();
        
        if (widget.showLoadingOnDebounce) {
          setState(() {
            _isWaiting = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !widget.enabled ? null : _handleTap,
      style: widget.style ?? _getDefaultStyle(context),
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    if (widget.showLoadingOnDebounce && _isWaiting) {
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

  ButtonStyle _getDefaultStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: context.colors.brand,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: context.textStyles.body.semiBold,
    );
  }
}
