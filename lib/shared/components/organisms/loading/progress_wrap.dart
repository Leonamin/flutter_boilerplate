import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/core/base/base_view_model.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/shared/components/atoms/loading/circle_loading.dart';

class ProgressWrap extends StatelessWidget {
  final Widget child;
  final BaseViewModel controller;
  final Color? backgroundColor;
  final WidgetBuilder? loadingWidget;

  const ProgressWrap({
    super.key,
    required this.controller,
    required this.child,
    this.backgroundColor,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Obx(
      () => Stack(
        children: [
          child,
          if (controller.isOnProgress.value)
            loadingWidget?.call(context) ??
                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    color:
                        backgroundColor ??
                        context.colors.backgroundPrimary.withValues(alpha: 0.5),
                  ),
                  child: CircleLoading(color: context.colors.textPrimary),
                ),
        ],
      ),
    );
  }
}
