import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 기본 버튼 컴포넌트
/// 
/// 앱 전체에서 사용되는 표준 버튼입니다.
/// 다양한 스타일과 상태를 지원합니다.
/// 
/// Example:
/// ```dart
/// DefaultButton(
///   '저장',
///   onTap: () => save(),
/// )
/// 
/// DefaultButton.primary(
///   context,
///   '확인',
///   onTap: () => confirm(),
/// )
/// ```
class DefaultButton extends StatelessWidget {
  /// 버튼에 표시될 텍스트
  final String text;
  
  /// 버튼 클릭 시 실행될 콜백
  final VoidCallback? onTap;
  
  /// 버튼 활성화 여부
  final bool isEnabled;
  
  /// 로딩 상태 여부
  final bool isLoading;
  
  /// 버튼 배경 색상
  final Color? backgroundColor;
  
  /// 버튼 텍스트 색상
  final Color? textColor;
  
  /// 버튼 테두리 색상
  final Color? borderColor;
  
  /// 버튼 높이
  final double? height;
  
  /// 버튼 너비
  final double? width;
  
  /// 버튼 패딩
  final EdgeInsetsGeometry? padding;
  
  /// 버튼 모서리 둥글기
  final double borderRadius;
  
  /// 텍스트 스타일
  final TextStyle? textStyle;
  
  /// 아이콘
  final Widget? icon;
  
  /// 아이콘과 텍스트 간격
  final double iconSpacing;

  const DefaultButton(
    this.text, {
    super.key,
    this.onTap,
    this.isEnabled = true,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.padding,
    this.borderRadius = 8.0,
    this.textStyle,
    this.icon,
    this.iconSpacing = 8.0,
  });

  /// 주요 액션용 버튼 (브랜드 색상)
  factory DefaultButton.primary(
    BuildContext context,
    String text, {
    VoidCallback? onTap,
    bool isEnabled = true,
    bool isLoading = false,
    Widget? icon,
  }) {
    return DefaultButton(
      text,
      onTap: onTap,
      isEnabled: isEnabled,
      isLoading: isLoading,
      backgroundColor: context.brandColor,
      textColor: Colors.white,
      icon: icon,
    );
  }

  /// 보조 액션용 버튼 (아웃라인)
  factory DefaultButton.secondary(
    BuildContext context,
    String text, {
    VoidCallback? onTap,
    bool isEnabled = true,
    bool isLoading = false,
    Widget? icon,
  }) {
    return DefaultButton(
      text,
      onTap: onTap,
      isEnabled: isEnabled,
      isLoading: isLoading,
      backgroundColor: Colors.transparent,
      textColor: context.brandColor,
      borderColor: context.brandColor,
      icon: icon,
    );
  }

  /// 위험한 액션용 버튼 (삭제 등)
  factory DefaultButton.danger(
    BuildContext context,
    String text, {
    VoidCallback? onTap,
    bool isEnabled = true,
    bool isLoading = false,
    Widget? icon,
  }) {
    return DefaultButton(
      text,
      onTap: onTap,
      isEnabled: isEnabled,
      isLoading: isLoading,
      backgroundColor: context.textError,
      textColor: Colors.white,
      icon: icon,
    );
  }

  /// 텍스트만 있는 버튼
  factory DefaultButton.text(
    BuildContext context,
    String text, {
    VoidCallback? onTap,
    bool isEnabled = true,
    Widget? icon,
  }) {
    return DefaultButton(
      text,
      onTap: onTap,
      isEnabled: isEnabled,
      backgroundColor: Colors.transparent,
      textColor: context.brandColor,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = _getBackgroundColor(context);
    final effectiveTextColor = _getTextColor(context);
    final effectiveBorderColor = _getBorderColor(context);

    return SizedBox(
      height: height ?? 48,
      width: width,
      child: Material(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: isEnabled && !isLoading ? onTap : null,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            decoration: BoxDecoration(
              border: effectiveBorderColor != null
                  ? Border.all(color: effectiveBorderColor)
                  : null,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        effectiveTextColor,
                      ),
                    ),
                  ),
                  SizedBox(width: iconSpacing),
                ] else if (icon != null) ...[
                  icon!,
                  SizedBox(width: iconSpacing),
                ],
                Flexible(
                  child: Text(
                    text,
                    style: (textStyle ?? context.textStyles.button)
                        .copyWith(color: effectiveTextColor),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (!isEnabled) {
      return context.backgroundSecondary;
    }
    return backgroundColor ?? context.brandColor;
  }

  Color _getTextColor(BuildContext context) {
    if (!isEnabled) {
      return context.textDisabled;
    }
    return textColor ?? Colors.white;
  }

  Color? _getBorderColor(BuildContext context) {
    if (!isEnabled) {
      return context.borderSecondary;
    }
    return borderColor;
  }
}
