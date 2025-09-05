import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';

/// 앱 전용 바텀시트 컴포넌트
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    this.title,
    this.content,
    this.contentWidget,
    this.actions,
    this.showCloseButton = false,
    this.closeButtonText,
    this.onClose,
    this.isDismissible = true,
    this.enableDrag = true,
  }) : assert(content != null || contentWidget != null, 'content 또는 contentWidget 중 하나는 필수입니다');

  /// 제목 (선택사항)
  final String? title;

  /// 텍스트 내용 (contentWidget과 둘 중 하나 필수)
  final String? content;

  /// 위젯 내용 (content와 둘 중 하나 필수)
  final Widget? contentWidget;

  /// 커스텀 액션 버튼들 (기본 close 버튼 제외)
  final List<Widget>? actions;

  /// Close 버튼 표시 여부 (기본값: false)
  final bool showCloseButton;

  /// Close 버튼 텍스트 (null이면 국제화된 기본 텍스트 사용)
  final String? closeButtonText;

  /// Close 버튼 콜백
  final VoidCallback? onClose;

  /// 외부 터치나 드래그로 닫기 가능 여부
  final bool isDismissible;

  /// 드래그로 닫기 가능 여부
  final bool enableDrag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDragHandle(context),
          if (title != null) _buildHeader(context),
          _buildContent(context),
          _buildActions(context),
          // 안전 영역을 위한 여백
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  /// 드래그 핸들
  Widget _buildDragHandle(BuildContext context) {
    if (!enableDrag) return const SizedBox.shrink();
    
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: context.colors.textSecondary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// 헤더 영역 (제목)
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        title!,
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
      padding: EdgeInsets.fromLTRB(
        24, 
        title != null ? 0 : 16, 
        24, 
        24
      ),
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
    
    // 기본 close 버튼 추가
    if (showCloseButton) {
      if (allActions.isNotEmpty) {
        allActions.add(const SizedBox(width: 12));
      }
      allActions.add(
        Expanded(
          child: AppButton(
            closeButtonText ?? '닫기', // TODO: intl 적용
            onTap: () {
              Navigator.of(context).pop();
              onClose?.call();
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
