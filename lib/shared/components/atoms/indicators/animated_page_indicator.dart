import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 애니메이션되는 페이지 인디케이터
/// 페이지가 많을 때 제한된 개수의 점만 표시하고, 현재 페이지가 중앙에 오도록 애니메이션합니다.
class AnimatedPageIndicator extends StatefulWidget {
  /// 전체 페이지 수
  final int totalPages;

  /// 현재 페이지 인덱스 (0부터 시작)
  final int currentIndex;

  /// 최대 표시할 점의 개수 (기본값: 5)
  final int maxVisibleDots;

  /// 각 점의 크기 (기본값: 8.0)
  final double dotSize;

  /// 점 사이의 간격 (기본값: 8.0)
  final double spacing;

  /// 애니메이션 지속시간 (기본값: 300ms)
  final Duration animationDuration;

  /// 활성 점의 색상 (null이면 테마 색상 사용)
  final Color? activeColor;

  /// 비활성 점의 색상 (null이면 테마 색상 사용)
  final Color? inactiveColor;

  const AnimatedPageIndicator({
    super.key,
    required this.totalPages,
    required this.currentIndex,
    this.maxVisibleDots = 5,
    this.dotSize = 8.0,
    this.spacing = 8.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.activeColor,
    this.inactiveColor,
  });

  @override
  State<AnimatedPageIndicator> createState() => _AnimatedPageIndicatorState();
}

class _AnimatedPageIndicatorState extends State<AnimatedPageIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _offsetAnimation;

  double _targetOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _offsetAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(AnimatedPageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      _updateAnimation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// 애니메이션 업데이트
  void _updateAnimation() {
    if (widget.totalPages <= widget.maxVisibleDots) {
      // 전체 페이지가 최대 표시 개수보다 적으면 애니메이션 불필요
      return;
    }

    final newOffset = _calculateOffset();

    if (newOffset != _targetOffset) {
      _offsetAnimation = Tween<double>(begin: _targetOffset, end: newOffset)
          .animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          );

      _targetOffset = newOffset;
      _animationController.forward(from: 0.0);
    }
  }

  /// 오프셋 계산
  double _calculateOffset() {
    final halfVisible = widget.maxVisibleDots ~/ 2;

    // 시작 부분
    if (widget.currentIndex <= halfVisible) {
      return 0.0;
    }

    // 끝 부분
    if (widget.currentIndex >= widget.totalPages - halfVisible - 1) {
      return (widget.totalPages - widget.maxVisibleDots).toDouble();
    }

    // 중간 부분 - 현재 인덱스가 중앙에 오도록
    return (widget.currentIndex - halfVisible).toDouble();
  }

  /// 표시할 점들의 인덱스 범위 계산
  List<int> _getVisibleIndices(double offset) {
    final startIndex = offset.round();
    final endIndex = (startIndex + widget.maxVisibleDots - 1).clamp(
      0,
      widget.totalPages - 1,
    );

    return List.generate(
      endIndex - startIndex + 1,
      (index) => startIndex + index,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.totalPages <= 1) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        final currentOffset = widget.totalPages <= widget.maxVisibleDots
            ? 0.0
            : _offsetAnimation.value;

        final visibleIndices = _getVisibleIndices(currentOffset);

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: visibleIndices.map((index) {
            final isActive = index == widget.currentIndex;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              child: AnimatedContainer(
                duration: widget.animationDuration,
                width: widget.dotSize,
                height: widget.dotSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? (widget.activeColor ?? context.colors.textInverse)
                      : (widget.inactiveColor ??
                            context.colors.textInverse.withValues(alpha: 0.4)),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
