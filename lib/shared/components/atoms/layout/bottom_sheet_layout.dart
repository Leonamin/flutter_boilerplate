import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

class BottomSheetLayout extends StatelessWidget {
  final Widget content;

  const BottomSheetLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildDragHandle(context),
          Expanded(child: _buildContent(context)),
          // 안전 영역을 위한 여백
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      decoration: BoxDecoration(
        color: context.colors.borderPrimary,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return content;
  }
}
