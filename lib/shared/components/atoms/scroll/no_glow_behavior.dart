import 'package:flutter/material.dart';

/// ScrollBehavior를 사용하여 ScrollBar를 제거하는 커스텀 ScrollBehavior
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
