import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_extension.dart';

/// 토글 버튼 색상 정의
enum ToggleButtonColor {
  /// 기본 색상 (검은색 계열)
  primary,

  /// 브랜드 색상
  brand,

  /// 성공 색상 (초록색)
  success,

  /// 에러 색상 (빨간색)
  error,

  /// 경고 색상 (주황색)
  warning,

  /// 정보 색상 (파란색)
  info,
}

/// 토글 버튼 색상 스키마
class ToggleButtonColorScheme {
  const ToggleButtonColorScheme({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeHandleColor,
    required this.inactiveHandleColor,
    required this.disabledActiveTrackColor,
    required this.disabledInactiveTrackColor,
    required this.disabledActiveHandleColor,
    required this.disabledInactiveHandleColor,
  });

  /// 활성화 상태의 트랙 색상
  final Color activeTrackColor;

  /// 비활성화 상태의 트랙 색상
  final Color inactiveTrackColor;

  /// 활성화 상태의 핸들 색상
  final Color activeHandleColor;

  /// 비활성화 상태의 핸들 색상
  final Color inactiveHandleColor;

  /// 비활성화된 활성화 상태의 트랙 색상
  final Color disabledActiveTrackColor;

  /// 비활성화된 비활성화 상태의 트랙 색상
  final Color disabledInactiveTrackColor;

  /// 비활성화된 활성화 상태의 핸들 색상
  final Color disabledActiveHandleColor;

  /// 비활성화된 비활성화 상태의 핸들 색상
  final Color disabledInactiveHandleColor;
}

extension ToggleButtonColorExtension on ToggleButtonColor {
  /// 색상에 따른 토글 버튼 색상 스키마 반환
  ToggleButtonColorScheme getColorScheme(BuildContext context) {
    final colors = context.colors;

    switch (this) {
      case ToggleButtonColor.primary:
        return ToggleButtonColorScheme(
          activeTrackColor: colors.textPrimary,
          inactiveTrackColor: colors.borderPrimary,
          activeHandleColor: colors.textInverse,
          inactiveHandleColor: colors.textInverse,
          disabledActiveTrackColor: colors.textDisabled,
          disabledInactiveTrackColor: colors.borderSecondary,
          disabledActiveHandleColor: colors.backgroundTertiary,
          disabledInactiveHandleColor: colors.backgroundTertiary,
        );

      case ToggleButtonColor.brand:
        return ToggleButtonColorScheme(
          activeTrackColor: colors.brand,
          inactiveTrackColor: colors.borderPrimary,
          activeHandleColor: colors.textInverse,
          inactiveHandleColor: colors.textInverse,
          disabledActiveTrackColor: colors.brand.withValues(alpha: 0.4),
          disabledInactiveTrackColor: colors.borderSecondary,
          disabledActiveHandleColor: colors.backgroundTertiary,
          disabledInactiveHandleColor: colors.backgroundTertiary,
        );

      case ToggleButtonColor.success:
        return ToggleButtonColorScheme(
          activeTrackColor: colors.backgroundSuccess,
          inactiveTrackColor: colors.borderPrimary,
          activeHandleColor: colors.textInverse,
          inactiveHandleColor: colors.textInverse,
          disabledActiveTrackColor: colors.backgroundSuccess.withValues(
            alpha: 0.4,
          ),
          disabledInactiveTrackColor: colors.borderSecondary,
          disabledActiveHandleColor: colors.backgroundTertiary,
          disabledInactiveHandleColor: colors.backgroundTertiary,
        );

      case ToggleButtonColor.error:
        return ToggleButtonColorScheme(
          activeTrackColor: colors.backgroundError,
          inactiveTrackColor: colors.borderPrimary,
          activeHandleColor: colors.textInverse,
          inactiveHandleColor: colors.textInverse,
          disabledActiveTrackColor: colors.backgroundError.withValues(
            alpha: 0.4,
          ),
          disabledInactiveTrackColor: colors.borderSecondary,
          disabledActiveHandleColor: colors.backgroundTertiary,
          disabledInactiveHandleColor: colors.backgroundTertiary,
        );

      case ToggleButtonColor.warning:
        return ToggleButtonColorScheme(
          activeTrackColor: colors.backgroundWarning,
          inactiveTrackColor: colors.borderPrimary,
          activeHandleColor: colors.textInverse,
          inactiveHandleColor: colors.textInverse,
          disabledActiveTrackColor: colors.backgroundWarning.withValues(
            alpha: 0.4,
          ),
          disabledInactiveTrackColor: colors.borderSecondary,
          disabledActiveHandleColor: colors.backgroundTertiary,
          disabledInactiveHandleColor: colors.backgroundTertiary,
        );

      case ToggleButtonColor.info:
        return ToggleButtonColorScheme(
          activeTrackColor: colors.backgroundInfo,
          inactiveTrackColor: colors.borderPrimary,
          activeHandleColor: colors.textInverse,
          inactiveHandleColor: colors.textInverse,
          disabledActiveTrackColor: colors.backgroundInfo.withValues(
            alpha: 0.4,
          ),
          disabledInactiveTrackColor: colors.borderSecondary,
          disabledActiveHandleColor: colors.backgroundTertiary,
          disabledInactiveHandleColor: colors.backgroundTertiary,
        );
    }
  }
}
