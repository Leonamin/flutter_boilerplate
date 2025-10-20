import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String path;
  final String pathDark;
  final double size;

  const AppLogo({
    super.key,
    this.path = 'assets/images/logo.png',
    this.pathDark = 'assets/images/logo_dark.png',
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(isDarkMode ? pathDark : path, fit: BoxFit.contain),
      ),
    );
  }
}
