import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';
import 'app_dialog.dart';

/// 다이얼로그를 간편하게 표시하는 유틸리티 클래스
class DialogUtil {
  /// 기본 다이얼로그 표시
  /// 
  /// [context] - BuildContext
  /// [title] - 다이얼로그 제목
  /// [content] - 텍스트 내용 (contentWidget과 둘 중 하나 필수)
  /// [contentWidget] - 위젯 내용 (content와 둘 중 하나 필수)
  /// [actions] - 커스텀 액션 버튼들
  /// [showDefaultCancelButton] - 기본 취소 버튼 표시 여부
  /// [cancelButtonText] - 취소 버튼 텍스트
  /// [onCancel] - 취소 버튼 콜백
  /// [barrierDismissible] - 외부 터치로 닫기 가능 여부
  /// 
  /// Returns: Future&lt;T?> - 다이얼로그 결과
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    List<Widget>? actions,
    bool showDefaultCancelButton = true,
    String? cancelButtonText,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppDialog(
        title: title,
        content: content,
        contentWidget: contentWidget,
        actions: actions,
        showDefaultCancelButton: showDefaultCancelButton,
        cancelButtonText: cancelButtonText,
        onCancel: onCancel,
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  /// 확인 다이얼로그 (확인 버튼만)
  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    VoidCallback? onConfirm,
    bool barrierDismissible = true,
  }) {
    return show<bool>(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      showDefaultCancelButton: false,
      actions: [
        Expanded(
          child: AppButton(
            confirmButtonText ?? '확인', // TODO: intl 적용
            onTap: () {
              Navigator.of(context).pop(true);
              onConfirm?.call();
            },
            variant: ButtonVariant.filled,
            size: ButtonSize.medium,
            fullWidth: true,
          ),
        ),
      ],
      barrierDismissible: barrierDismissible,
    );
  }

  /// 확인/취소 다이얼로그
  static Future<bool?> showConfirmCancel({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    String? cancelButtonText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return show<bool>(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      showDefaultCancelButton: false,
      actions: [
        Expanded(
          child: AppButton(
            cancelButtonText ?? '취소', // TODO: intl 적용
            onTap: () {
              Navigator.of(context).pop(false);
              onCancel?.call();
            },
            variant: ButtonVariant.outlined,
            size: ButtonSize.medium,
            fullWidth: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppButton(
            confirmButtonText ?? '확인', // TODO: intl 적용
            onTap: () {
              Navigator.of(context).pop(true);
              onConfirm?.call();
            },
            variant: ButtonVariant.filled,
            size: ButtonSize.medium,
            fullWidth: true,
          ),
        ),
      ],
      barrierDismissible: barrierDismissible,
    );
  }

  /// 정보 다이얼로그
  static Future<bool?> showInfo({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    VoidCallback? onConfirm,
    bool barrierDismissible = true,
  }) {
    return showConfirm(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      confirmButtonText: confirmButtonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  /// 경고 다이얼로그
  static Future<bool?> showWarning({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    String? cancelButtonText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return showConfirmCancel(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      confirmButtonText: confirmButtonText,
      cancelButtonText: cancelButtonText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      barrierDismissible: barrierDismissible,
    );
  }

  /// 에러 다이얼로그
  static Future<bool?> showError({
    required BuildContext context,
    required String title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    VoidCallback? onConfirm,
    bool barrierDismissible = true,
  }) {
    return showConfirm(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      confirmButtonText: confirmButtonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  /// 커스텀 위젯 다이얼로그
  static Future<T?> showCustomWidget<T>({
    required BuildContext context,
    required String title,
    required Widget contentWidget,
    List<Widget>? actions,
    bool showDefaultCancelButton = true,
    String? cancelButtonText,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return show<T>(
      context: context,
      title: title,
      contentWidget: contentWidget,
      actions: actions,
      showDefaultCancelButton: showDefaultCancelButton,
      cancelButtonText: cancelButtonText,
      onCancel: onCancel,
      barrierDismissible: barrierDismissible,
    );
  }

  /// 로딩 다이얼로그
  static Future<void> showLoading({
    required BuildContext context,
    String? title,
    String? message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppDialog(
        title: title ?? '로딩 중...', // TODO: intl 적용
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(message),
            ],
          ],
        ),
        showDefaultCancelButton: false,
        barrierDismissible: false,
      ),
    );
  }

  /// 로딩 다이얼로그 닫기
  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
