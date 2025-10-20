import 'package:flutter/widgets.dart';

class BouncingScrollView extends StatelessWidget {
  final ScrollController? controller;
  final Axis scrollDirection;
  final EdgeInsets? padding;

  final Widget child;

  const BouncingScrollView({
    super.key,
    required this.child,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      scrollDirection: scrollDirection,
      padding: padding,
      child: child,
    );
  }
}
