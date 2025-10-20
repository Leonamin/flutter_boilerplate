import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/index.dart';
import 'package:flutter_boilerplate/shared/components/index.dart';

/// PagedListView용 에러 상태 인디케이터
///
/// infinite_scroll_pagination의 firstPageErrorIndicatorBuilder 및
/// newPageErrorIndicatorBuilder에서 사용하기 위한 재사용 가능한 컴포넌트
class PagedErrorIndicator extends StatelessWidget {
  /// 제목
  final String title;

  /// 설명 (선택사항)
  final String? description;

  /// 아이콘
  final IconData? icon;

  /// 아이콘 색상 (null이면 context.colors.textError 사용)
  final Color? iconColor;

  /// 아이콘 크기
  final double iconSize;

  /// 재시도 버튼 텍스트 (null이면 버튼 미표시)
  final String? retryButtonText;

  /// 재시도 콜백
  final VoidCallback? onRetry;

  /// 재시도 버튼 색상
  final ButtonColor retryButtonColor;

  /// 재시도 버튼 스타일
  final ButtonVariant retryButtonVariant;

  /// 보조 버튼 위젯 (선택사항)
  final Widget? secondaryButton;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 제목과 설명 사이 간격
  final double titleDescriptionSpacing;

  /// 아이콘과 제목 사이 간격
  final double iconTitleSpacing;

  /// 설명과 버튼 사이 간격
  final double descriptionButtonSpacing;

  /// 새 페이지 에러용 간소화 버전 여부
  final bool isCompact;

  const PagedErrorIndicator({
    super.key,
    required this.title,
    this.description,
    this.icon = Icons.error_outline,
    this.iconColor,
    this.iconSize = 80.0,
    this.retryButtonText,
    this.onRetry,
    this.retryButtonColor = ButtonColor.brand,
    this.retryButtonVariant = ButtonVariant.text,
    this.secondaryButton,
    this.padding = const EdgeInsets.all(32),
    this.titleDescriptionSpacing = 8.0,
    this.iconTitleSpacing = 16.0,
    this.descriptionButtonSpacing = 16.0,
    this.isCompact = false,
  });

  /// 첫 페이지 에러용 생성자
  const PagedErrorIndicator.firstPage({
    super.key,
    required this.title,
    this.description,
    this.retryButtonText,
    this.onRetry,
    this.icon = Icons.error_outline,
    this.iconColor,
    this.retryButtonColor = ButtonColor.brand,
    this.retryButtonVariant = ButtonVariant.text,
    this.secondaryButton,
  }) : iconSize = 80.0,
       padding = const EdgeInsets.all(32),
       titleDescriptionSpacing = 8.0,
       iconTitleSpacing = 16.0,
       descriptionButtonSpacing = 16.0,
       isCompact = false;

  /// 새 페이지 에러용 생성자 (간소화된 버전)
  const PagedErrorIndicator.newPage({
    super.key,
    required String this.retryButtonText,
    required VoidCallback this.onRetry,
  }) : title = '',
       description = null,
       icon = Icons.error_outline,
       iconColor = null,
       iconSize = 40.0,
       retryButtonColor = ButtonColor.brand,
       retryButtonVariant = ButtonVariant.outlined,
       secondaryButton = null,
       padding = const EdgeInsets.all(16),
       titleDescriptionSpacing = 8.0,
       iconTitleSpacing = 8.0,
       descriptionButtonSpacing = 12.0,
       isCompact = true;

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return Center(
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? context.colors.textError,
              ),
              if (retryButtonText != null) ...[
                SizedBox(height: descriptionButtonSpacing),
                AppButton(
                  retryButtonText!,
                  onTap: onRetry,
                  color: retryButtonColor,
                  variant: retryButtonVariant,
                  size: ButtonSize.medium,
                ),
              ],
            ],
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
            // 아이콘
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? context.colors.textError,
              ),
              SizedBox(height: iconTitleSpacing),
            ],

            // 제목
            if (title.isNotEmpty) ...[
              Text(
                title,
                style: context.textStyles.header3.primary(context),
                textAlign: TextAlign.center,
              ),
            ],

            // 설명
            if (description != null) ...[
              SizedBox(height: titleDescriptionSpacing),
              Text(
                description!,
                style: context.textStyles.body.secondary(context),
                textAlign: TextAlign.center,
              ),
            ],

            // 버튼들
            if (retryButtonText != null || secondaryButton != null) ...[
              SizedBox(height: descriptionButtonSpacing),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  // 재시도 버튼
                  if (retryButtonText != null)
                    AppButton(
                      retryButtonText!,
                      onTap: onRetry,
                      color: retryButtonColor,
                      variant: retryButtonVariant,
                      size: ButtonSize.large,
                    ),

                  // 보조 버튼
                  if (secondaryButton != null) secondaryButton!,
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
