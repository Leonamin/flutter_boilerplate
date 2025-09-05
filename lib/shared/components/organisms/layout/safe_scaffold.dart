import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/organisms/headers/empty_app_bar.dart';

class SafeScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget child;
  final Color? statusBarColor;
  final Color? backgroundColor;
  final bool enableBottomSafeArea;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;

  final VoidCallback? onTap;

  const SafeScaffold({
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.statusBarColor,
    this.backgroundColor,
    this.enableBottomSafeArea = true,
    required this.child,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar:
            appBar ??
            EmptyAppBar(backgroundColor: statusBarColor ?? backgroundColor),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor,
        body: SafeArea(bottom: enableBottomSafeArea, child: child),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
