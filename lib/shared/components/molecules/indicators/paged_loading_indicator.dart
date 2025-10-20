import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/index.dart';

/// PagedListView용 로딩 상태 인디케이터
///
/// infinite_scroll_pagination의 firstPageProgressIndicatorBuilder 및
/// newPageProgressIndicatorBuilder에서 사용하기 위한 재사용 가능한 컴포넌트
class PagedLoadingIndicator extends StatelessWidget {
  /// 로딩 메시지
  final String? message;

  /// 인디케이터 색상 (null이면 context.colors.textPrimary 사용)
  final Color? indicatorColor;

  /// 인디케이터 크기
  final double indicatorSize;

  /// 메시지와 인디케이터 사이 간격
  final double spacing;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 새 페이지 로딩용 간소화 버전 여부
  final bool isCompact;

  const PagedLoadingIndicator({
    super.key,
    this.message,
    this.indicatorColor,
    this.indicatorSize = 36.0,
    this.spacing = 16.0,
    this.padding = const EdgeInsets.all(32),
    this.isCompact = false,
  });

  /// 첫 페이지 로딩용 생성자
  const PagedLoadingIndicator.firstPage({
    super.key,
    required String this.message,
    this.indicatorColor,
  }) : indicatorSize = 36.0,
       spacing = 16.0,
       padding = const EdgeInsets.all(32),
       isCompact = false;

  /// 새 페이지 로딩용 생성자 (간소화된 버전)
  const PagedLoadingIndicator.newPage({super.key, this.indicatorColor})
    : message = null,
      indicatorSize = 24.0,
      spacing = 0,
      padding = const EdgeInsets.all(16),
      isCompact = true;

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return Center(
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              color: indicatorColor ?? context.colors.textSecondary,
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: indicatorSize,
              height: indicatorSize,
              child: CircularProgressIndicator(
                color: indicatorColor ?? context.colors.textPrimary,
              ),
            ),
            if (message != null) ...[
              SizedBox(height: spacing),
              Text(
                message!,
                style: context.textStyles.body.secondary(context),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
