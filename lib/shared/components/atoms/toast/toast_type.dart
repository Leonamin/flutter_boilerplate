import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 토스트 메시지 타입
enum ToastType {
  success,
  info,
  warning,
  error;

  /// 토스트 타입에 따른 아이콘 반환
  IconData get icon {
    switch (this) {
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.info:
        return Icons.info_outline;
      case ToastType.warning:
        return Icons.warning_amber_outlined;
      case ToastType.error:
        return Icons.error_outline;
    }
  }

  /// 토스트 타입에 따른 색상 반환
  Color color(BuildContext context) {
    final colors = context.colors;
    switch (this) {
      case ToastType.success:
        return colors.textSuccess;
      case ToastType.info:
        return colors.textInfo;
      case ToastType.warning:
        return colors.textWarning;
      case ToastType.error:
        return colors.textError;
    }
  }

  /// 토스트 타입에 따른 배경색 반환 (흰색 기본)
  Color backgroundColor(BuildContext context) {
    final colors = context.colors;
    switch (this) {
      case ToastType.success:
        return colors.backgroundSuccessSubtle;
      case ToastType.info:
        return colors.backgroundInfoSubtle;
      case ToastType.warning:
        return colors.backgroundWarningSubtle;
      case ToastType.error:
        return colors.backgroundErrorSubtle;
    }
  }

  /// 토스트 타입에 따른 텍스트 색상 반환
  Color textColor(BuildContext context) {
    final colors = context.colors;
    switch (this) {
      case ToastType.success:
        return colors.textPrimary;
      case ToastType.info:
        return colors.textPrimary;
      case ToastType.warning:
        return colors.textPrimary;
      case ToastType.error:
        return colors.textPrimary;
    }
  }
}
