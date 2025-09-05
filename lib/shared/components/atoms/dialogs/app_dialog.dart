import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';

/// 앱 전용 다이얼로그 컴포넌트
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.content,
    this.contentWidget,
    this.actions,
    this.showDefaultCancelButton = true,
    this.cancelButtonText,
    this.onCancel,
    this.barrierDismissible = true,
  }) : assert(content != null || contentWidget != null, 'content 또는 contentWidget 중 하나는 필수입니다');

  /// 제목
  final String title;

  /// 텍스트 내용 (contentWidget과 둘 중 하나 필수)
  final String? content;

  /// 위젯 내용 (content와 둘 중 하나 필수)
  final Widget? contentWidget;

  /// 커스텀 액션 버튼들 (기본 cancel 버튼 제외)
  final List<Widget>? actions;

  /// 기본 cancel 버튼 표시 여부
  final bool showDefaultCancelButton;

  /// cancel 버튼 텍스트 (null이면 국제화된 기본 텍스트 사용)
  final String? cancelButtonText;

  /// cancel 버튼 콜백
  final VoidCallback? onCancel;

  /// 외부 터치로 닫기 가능 여부
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: context.colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            _buildContent(context),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  /// 헤더 영역 (제목)
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Text(
        title,
        style: context.textStyles.header3.copyWith(
          color: context.colors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// 내용 영역
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: contentWidget ?? Text(
        content!,
        style: context.textStyles.body.copyWith(
          color: context.colors.textSecondary,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// 액션 버튼 영역
  Widget _buildActions(BuildContext context) {
    final allActions = <Widget>[];
    
    // 커스텀 액션 버튼들 추가
    if (actions != null) {
      allActions.addAll(actions!);
    }
    
    // 기본 cancel 버튼 추가
    if (showDefaultCancelButton) {
      if (allActions.isNotEmpty) {
        allActions.add(const SizedBox(width: 12));
      }
      allActions.add(
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
      );
    }
    
    if (allActions.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Row(children: allActions),
    );
  }
}
