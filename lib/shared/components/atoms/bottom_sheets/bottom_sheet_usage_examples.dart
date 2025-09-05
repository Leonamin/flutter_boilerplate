import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';
import 'bottom_sheet_util.dart';

/// 바텀시트 사용 예시 화면
class BottomSheetUsageExamples extends StatelessWidget {
  const BottomSheetUsageExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('바텀시트 예시'),
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
              '기본 바텀시트',
              [
                _buildExampleButton(
                  context,
                  '확인 바텀시트',
                  '확인 버튼만 있는 기본 바텀시트',
                  () => _showConfirmBottomSheet(context),
                ),
                _buildExampleButton(
                  context,
                  '확인/취소 바텀시트',
                  '확인과 취소 버튼이 있는 바텀시트',
                  () => _showConfirmCancelBottomSheet(context),
                ),
                _buildExampleButton(
                  context,
                  '정보 바텀시트',
                  '정보를 표시하는 바텀시트',
                  () => _showInfoBottomSheet(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '특수 바텀시트',
              [
                _buildExampleButton(
                  context,
                  '선택 바텀시트',
                  '여러 옵션 중 선택하는 바텀시트',
                  () => _showSelectionBottomSheet(context),
                ),
                _buildExampleButton(
                  context,
                  '리스트 바텀시트',
                  '스크롤 가능한 긴 리스트 바텀시트',
                  () => _showListBottomSheet(context),
                ),
                _buildExampleButton(
                  context,
                  'Close 버튼 있는 바텀시트',
                  'Close 버튼을 표시하는 바텀시트',
                  () => _showCloseButtonBottomSheet(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '커스텀 바텀시트',
              [
                _buildExampleButton(
                  context,
                  '커스텀 위젯 바텀시트',
                  '커스텀 위젯을 포함한 바텀시트',
                  () => _showCustomWidgetBottomSheet(context),
                ),
                _buildExampleButton(
                  context,
                  '커스텀 버튼 바텀시트',
                  '커스텀 버튼들을 가진 바텀시트',
                  () => _showCustomButtonBottomSheet(context),
                ),
                _buildExampleButton(
                  context,
                  '드래그 비활성화 바텀시트',
                  '드래그로 닫기가 비활성화된 바텀시트',
                  () => _showNoDragBottomSheet(context),
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

  // 예시 바텀시트 메서드들
  void _showConfirmBottomSheet(BuildContext context) {
    BottomSheetUtil.showConfirm(
      context: context,
      title: '확인',
      content: '이것은 확인 바텀시트입니다.\n확인 버튼만 표시됩니다.',
      onConfirm: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('확인 버튼이 눌렸습니다')),
        );
      },
    );
  }

  void _showConfirmCancelBottomSheet(BuildContext context) {
    BottomSheetUtil.showConfirmCancel(
      context: context,
      title: '확인/취소',
      content: '이것은 확인/취소 바텀시트입니다.\n두 개의 버튼이 표시됩니다.',
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

  void _showInfoBottomSheet(BuildContext context) {
    BottomSheetUtil.showInfo(
      context: context,
      title: '정보',
      content: '이것은 정보 바텀시트입니다.\n중요한 정보를 사용자에게 알릴 때 사용합니다.',
    );
  }

  void _showSelectionBottomSheet(BuildContext context) {
    BottomSheetUtil.showSelection<String>(
      context: context,
      title: '옵션 선택',
      options: [
        const BottomSheetOption(
          title: '옵션 1',
          subtitle: '첫 번째 옵션입니다',
          value: 'option1',
          icon: Icons.looks_one,
        ),
        const BottomSheetOption(
          title: '옵션 2',
          subtitle: '두 번째 옵션입니다',
          value: 'option2',
          icon: Icons.looks_two,
        ),
        const BottomSheetOption(
          title: '옵션 3',
          subtitle: '세 번째 옵션입니다',
          value: 'option3',
          icon: Icons.looks_3,
        ),
      ],
    ).then((result) {
      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('선택된 옵션: $result')),
        );
      }
    });
  }

  void _showListBottomSheet(BuildContext context) {
    final items = List.generate(20, (index) => 
      ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text('아이템 ${index + 1}'),
        subtitle: Text('이것은 ${index + 1}번째 아이템입니다'),
        onTap: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('아이템 ${index + 1}이 선택되었습니다')),
          );
        },
      ),
    );

    BottomSheetUtil.showList(
      context: context,
      title: '긴 리스트',
      items: items,
      showCloseButton: true,
    );
  }

  void _showCloseButtonBottomSheet(BuildContext context) {
    BottomSheetUtil.show(
      context: context,
      title: 'Close 버튼',
      content: '이 바텀시트는 Close 버튼이 표시됩니다.\n기본적으로는 숨겨져 있지만 필요시 표시할 수 있습니다.',
      showCloseButton: true,
      onClose: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Close 버튼이 눌렸습니다')),
        );
      },
    );
  }

  void _showCustomWidgetBottomSheet(BuildContext context) {
    BottomSheetUtil.showCustomWidget(
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
          const Text('이것은 커스텀 위젯을 포함한 바텀시트입니다.'),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite, color: Colors.red),
              Icon(Icons.thumb_up, color: Colors.green),
              Icon(Icons.share, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  void _showCustomButtonBottomSheet(BuildContext context) {
    BottomSheetUtil.show(
      context: context,
      title: '커스텀 버튼',
      content: '이 바텀시트는 커스텀 버튼들을 가지고 있습니다.',
      showCloseButton: false,
      actions: [
        Expanded(
          child: AppButton(
            '옵션 A',
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('옵션 A가 선택되었습니다')),
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
            '옵션 B',
            onTap: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('옵션 B가 선택되었습니다')),
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

  void _showNoDragBottomSheet(BuildContext context) {
    BottomSheetUtil.show(
      context: context,
      title: '드래그 비활성화',
      content: '이 바텀시트는 드래그로 닫을 수 없습니다.\n버튼을 눌러서만 닫을 수 있습니다.',
      enableDrag: false,
      isDismissible: false,
      showCloseButton: true,
    );
  }
}
