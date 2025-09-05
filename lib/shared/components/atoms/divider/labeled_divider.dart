import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final Color? dividerColor;

  const LabeledDivider({
    super.key,
    required this.label,
    this.labelStyle,
    this.dividerColor,
  });

  factory LabeledDivider.primary(
    BuildContext context, {
    required String label,
    TextStyle? labelStyle,
  }) {
    return LabeledDivider(
      label: label,
      labelStyle: labelStyle,
      dividerColor: context.colors.borderPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Expanded(child: Divider(color: dividerColor)),
        Text(label, style: labelStyle),
        Expanded(child: Divider(color: dividerColor)),
      ],
    );
  }
}
