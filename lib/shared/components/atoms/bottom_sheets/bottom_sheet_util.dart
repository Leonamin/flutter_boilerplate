import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';
import 'app_bottom_sheet.dart';

/// 바텀시트를 간편하게 표시하는 유틸리티 클래스
class BottomSheetUtil {
  /// 기본 바텀시트 표시
  /// 
  /// [context] - BuildContext
  /// [title] - 바텀시트 제목 (선택사항)
  /// [content] - 텍스트 내용 (contentWidget과 둘 중 하나 필수)
  /// [contentWidget] - 위젯 내용 (content와 둘 중 하나 필수)
  /// [actions] - 커스텀 액션 버튼들
  /// [showCloseButton] - Close 버튼 표시 여부 (기본값: false)
  /// [closeButtonText] - Close 버튼 텍스트
  /// [onClose] - Close 버튼 콜백
  /// [isDismissible] - 외부 터치로 닫기 가능 여부
  /// [enableDrag] - 드래그로 닫기 가능 여부
  /// 
  /// Returns: Future<T?> - 바텀시트 결과
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    String? content,
    Widget? contentWidget,
    List<Widget>? actions,
    bool showCloseButton = false,
    String? closeButtonText,
    VoidCallback? onClose,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AppBottomSheet(
        title: title,
        content: content,
        contentWidget: contentWidget,
        actions: actions,
        showCloseButton: showCloseButton,
        closeButtonText: closeButtonText,
        onClose: onClose,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
      ),
    );
  }

  /// 확인 바텀시트 (확인 버튼만)
  static Future<bool?> showConfirm({
    required BuildContext context,
    String? title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    VoidCallback? onConfirm,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return show<bool>(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      showCloseButton: false,
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
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// 확인/취소 바텀시트
  static Future<bool?> showConfirmCancel({
    required BuildContext context,
    String? title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    String? cancelButtonText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return show<bool>(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      showCloseButton: false,
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
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// 정보 바텀시트
  static Future<bool?> showInfo({
    required BuildContext context,
    String? title,
    String? content,
    Widget? contentWidget,
    String? confirmButtonText,
    VoidCallback? onConfirm,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showConfirm(
      context: context,
      title: title,
      content: content,
      contentWidget: contentWidget,
      confirmButtonText: confirmButtonText,
      onConfirm: onConfirm,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// 선택 바텀시트 (여러 옵션 중 선택)
  static Future<T?> showSelection<T>({
    required BuildContext context,
    String? title,
    required List<BottomSheetOption<T>> options,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return show<T>(
      context: context,
      title: title,
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) => _buildOptionTile(context, option)).toList(),
      ),
      showCloseButton: false,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// 커스텀 위젯 바텀시트
  static Future<T?> showCustomWidget<T>({
    required BuildContext context,
    String? title,
    required Widget contentWidget,
    List<Widget>? actions,
    bool showCloseButton = false,
    String? closeButtonText,
    VoidCallback? onClose,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return show<T>(
      context: context,
      title: title,
      contentWidget: contentWidget,
      actions: actions,
      showCloseButton: showCloseButton,
      closeButtonText: closeButtonText,
      onClose: onClose,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// 리스트 바텀시트 (스크롤 가능한 긴 리스트)
  static Future<T?> showList<T>({
    required BuildContext context,
    String? title,
    required List<Widget> items,
    double? maxHeight,
    bool showCloseButton = false,
    String? closeButtonText,
    VoidCallback? onClose,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return show<T>(
      context: context,
      title: title,
      contentWidget: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.6,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items,
          ),
        ),
      ),
      showCloseButton: showCloseButton,
      closeButtonText: closeButtonText,
      onClose: onClose,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// 옵션 타일 생성 헬퍼 메서드
  static Widget _buildOptionTile<T>(BuildContext context, BottomSheetOption<T> option) {
    return ListTile(
      leading: option.icon != null ? Icon(option.icon) : null,
      title: Text(option.title),
      subtitle: option.subtitle != null ? Text(option.subtitle!) : null,
      onTap: () {
        Navigator.of(context).pop(option.value);
        option.onTap?.call();
      },
    );
  }
}

/// 바텀시트 옵션 클래스
class BottomSheetOption<T> {
  const BottomSheetOption({
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.onTap,
  });

  /// 옵션 제목
  final String title;

  /// 옵션 값
  final T value;

  /// 옵션 부제목 (선택사항)
  final String? subtitle;

  /// 옵션 아이콘 (선택사항)
  final IconData? icon;

  /// 옵션 선택 시 콜백
  final VoidCallback? onTap;
}
