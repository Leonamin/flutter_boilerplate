import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';
import 'dialog_util.dart';

/// 다이얼로그 사용 예시 화면
class DialogUsageExamples extends StatelessWidget {
  const DialogUsageExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('다이얼로그 예시'),
        backgroundColor: context.colors.backgroundPrimary,
        foregroundColor: context.colors.textPrimary,
        elevation: 1,
      ),
      backgroundColor: context.colors.backgroundPrimary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              context,
              '기본 다이얼로그',
              [
                _buildExampleButton(
                  context,
                  '확인 다이얼로그',
                  '확인 버튼만 있는 기본 다이얼로그',
                  () => _showConfirmDialog(context),
                ),
                _buildExampleButton(
                  context,
                  '확인/취소 다이얼로그',
                  '확인과 취소 버튼이 있는 다이얼로그',
                  () => _showConfirmCancelDialog(context),
                ),
                _buildExampleButton(
                  context,
                  '정보 다이얼로그',
                  '정보를 표시하는 다이얼로그',
                  () => _showInfoDialog(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '특수 다이얼로그',
              [
                _buildExampleButton(
                  context,
                  '경고 다이얼로그',
                  '경고 메시지를 표시하는 다이얼로그',
                  () => _showWarningDialog(context),
                ),
                _buildExampleButton(
                  context,
                  '에러 다이얼로그',
                  '에러 메시지를 표시하는 다이얼로그',
                  () => _showErrorDialog(context),
                ),
                _buildExampleButton(
                  context,
                  '로딩 다이얼로그',
                  '로딩 상태를 표시하는 다이얼로그',
                  () => _showLoadingDialog(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '커스텀 다이얼로그',
              [
                _buildExampleButton(
                  context,
                  '커스텀 위젯 다이얼로그',
                  '커스텀 위젯을 포함한 다이얼로그',
                  () => _showCustomWidgetDialog(context),
                ),
                _buildExampleButton(
                  context,
                  '커스텀 버튼 다이얼로그',
                  '커스텀 버튼들을 가진 다이얼로그',
                  () => _showCustomButtonDialog(context),
                ),
                _buildExampleButton(
                  context,
                  '취소 버튼 없는 다이얼로그',
                  '취소 버튼을 숨긴 다이얼로그',
                  () => _showNoCancelDialog(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textStyles.header3.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildExampleButton(
    BuildContext context,
    String title,
    String description,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        color: context.colors.backgroundSecondary,
        child: ListTile(
          title: Text(
            title,
            style: context.textStyles.body.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            description,
            style: context.textStyles.caption.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: context.colors.textSecondary,
            size: 16,
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  // 예시 다이얼로그 메서드들
  void _showConfirmDialog(BuildContext context) {
    DialogUtil.showConfirm(
      context: context,
      title: '확인',
      content: '이것은 확인 다이얼로그입니다.\n확인 버튼만 표시됩니다.',
      onConfirm: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('확인 버튼이 눌렸습니다')),
        );
      },
    );
  }

  void _showConfirmCancelDialog(BuildContext context) {
    DialogUtil.showConfirmCancel(
      context: context,
      title: '확인/취소',
      content: '이것은 확인/취소 다이얼로그입니다.\n두 개의 버튼이 표시됩니다.',
      onConfirm: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('확인 버튼이 눌렸습니다')),
        );
      },
      onCancel: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('취소 버튼이 눌렸습니다')),
        );
      },
    );
  }

  void _showInfoDialog(BuildContext context) {
    DialogUtil.showInfo(
      context: context,
      title: '정보',
      content: '이것은 정보 다이얼로그입니다.\n중요한 정보를 사용자에게 알릴 때 사용합니다.',
    );
  }

  void _showWarningDialog(BuildContext context) {
    DialogUtil.showWarning(
      context: context,
      title: '경고',
      content: '이것은 경고 다이얼로그입니다.\n사용자에게 주의를 요하는 상황을 알릴 때 사용합니다.',
      confirmButtonText: '계속',
      cancelButtonText: '취소',
    );
  }

  void _showErrorDialog(BuildContext context) {
    DialogUtil.showError(
      context: context,
      title: '오류 발생',
      content: '예상치 못한 오류가 발생했습니다.\n잠시 후 다시 시도해 주세요.',
      confirmButtonText: '확인',
    );
  }

  void _showLoadingDialog(BuildContext context) {
    DialogUtil.showLoading(
      context: context,
      title: '처리 중...',
      message: '잠시만 기다려 주세요.',
    );

    // 3초 후 자동으로 닫기
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        DialogUtil.hideLoading(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('처리가 완료되었습니다')),
        );
      }
    });
  }

  void _showCustomWidgetDialog(BuildContext context) {
    DialogUtil.showCustomWidget(
      context: context,
      title: '커스텀 위젯',
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 48,
            color: Colors.amber,
          ),
          const SizedBox(height: 16),
          const Text('이것은 커스텀 위젯을 포함한 다이얼로그입니다.'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '위젯을 자유롭게 배치할 수 있습니다.',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomButtonDialog(BuildContext context) {
    DialogUtil.show(
      context: context,
      title: '커스텀 버튼',
      content: '이 다이얼로그는 커스텀 버튼들을 가지고 있습니다.',
      showDefaultCancelButton: false,
      actions: [
        Expanded(
          child: AppButton(
            '옵션 1',
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('옵션 1이 선택되었습니다')),
              );
            },
            variant: ButtonVariant.outlined,
            size: ButtonSize.medium,
            fullWidth: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppButton(
            '옵션 2',
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('옵션 2가 선택되었습니다')),
              );
            },
            variant: ButtonVariant.filled,
            size: ButtonSize.medium,
            fullWidth: true,
          ),
        ),
      ],
    );
  }

  void _showNoCancelDialog(BuildContext context) {
    DialogUtil.show(
      context: context,
      title: '취소 버튼 없음',
      content: '이 다이얼로그는 기본 취소 버튼이 숨겨져 있습니다.\n커스텀 액션만 표시됩니다.',
      showDefaultCancelButton: false,
      actions: [
        Expanded(
          child: AppButton(
            '완료',
            onTap: () {
              Navigator.of(context).pop();
            },
            variant: ButtonVariant.filled,
            size: ButtonSize.medium,
            fullWidth: true,
          ),
        ),
      ],
    );
  }
}
