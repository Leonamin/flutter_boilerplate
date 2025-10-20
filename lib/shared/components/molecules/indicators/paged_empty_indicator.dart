import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/index.dart';
import 'package:flutter_boilerplate/shared/components/index.dart';

/// PagedListView용 빈 상태 인디케이터
///
/// infinite_scroll_pagination의 noItemsFoundIndicatorBuilder에서
/// 사용하기 위한 재사용 가능한 컴포넌트
class PagedEmptyIndicator extends StatelessWidget {
  /// 제목
  final String title;

  /// 설명 (선택사항)
  final String? description;

  /// 아이콘
  final IconData? icon;

  /// 아이콘 색상 (null이면 context.colors.textSecondary 사용)
  final Color? iconColor;

  /// 아이콘 크기
  final double iconSize;

  /// 주 버튼 텍스트 (null이면 버튼 미표시)
  final String? primaryButtonText;

  /// 주 버튼 콜백
  final VoidCallback? onPrimaryButtonTap;

  /// 주 버튼 색상
  final ButtonColor primaryButtonColor;

  /// 주 버튼 스타일
  final ButtonVariant primaryButtonVariant;

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

  const PagedEmptyIndicator({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    this.iconSize = 80.0,
    this.primaryButtonText,
    this.onPrimaryButtonTap,
    this.primaryButtonColor = ButtonColor.brand,
    this.primaryButtonVariant = ButtonVariant.outlined,
    this.secondaryButton,
    this.padding = const EdgeInsets.all(32),
    this.titleDescriptionSpacing = 8.0,
    this.iconTitleSpacing = 16.0,
    this.descriptionButtonSpacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
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
                color: iconColor ?? context.colors.textSecondary,
              ),
              SizedBox(height: iconTitleSpacing),
            ],

            // 제목
            Text(
              title,
              style: context.textStyles.header3.primary(context),
              textAlign: TextAlign.center,
            ),

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
            if (primaryButtonText != null || secondaryButton != null) ...[
              SizedBox(height: descriptionButtonSpacing),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  // 주 버튼
                  if (primaryButtonText != null)
                    AppButton(
                      primaryButtonText!,
                      onTap: onPrimaryButtonTap,
                      color: primaryButtonColor,
                      variant: primaryButtonVariant,
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
