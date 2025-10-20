import 'package:flutter/material.dart';

class AppSlogan extends StatelessWidget {
  final double? width;
  final double? height;
  final String path;
  final String pathDark;

  const AppSlogan({
    super.key,
    this.width,
    this.height,
    this.path = 'assets/images/slogan_light.png',
    this.pathDark = 'assets/images/slogan_dark.png',
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Image.asset(
      isDarkMode ? pathDark : path,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
