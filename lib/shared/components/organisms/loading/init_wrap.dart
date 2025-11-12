import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_boilerplate/core/base/base_view_model.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/shared/components/atoms/loading/circle_loading.dart';

class InitWrap extends StatelessWidget {
  final WidgetBuilder builder;
  final BaseViewModel controller;
  final Color? backgroundColor;

  final WidgetBuilder? loadingWidget;

  const InitWrap({
    super.key,
    required this.controller,
    required this.builder,
    this.backgroundColor,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.completedInit.value
          ? builder(context)
          : loadingWidget?.call(context) ??
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color:
                        backgroundColor ??
                        context.colors.backgroundPrimary.withValues(alpha: 0.5),
                  ),
                  child: CircleLoading(color: context.colors.textPrimary),
                ),
    );
  }
}
