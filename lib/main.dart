import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/di/dependency_injection.dart';
import 'package:flutter_boilerplate/core/routes/app_router.dart';
import 'package:flutter_boilerplate/core/theme/app_theme_extension.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';
import 'package:go_router/go_router.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // 의존성 주입 초기화
      await DependencyInjection.init();

      final appRouter = initAppRouter();

      runApp(MyApp(routerConfig: appRouter));
    },
    (error, stack) {
      Logger.error('Error: $error', tag: 'main');
    },
  );
}

class MyApp extends StatelessWidget {
  final GoRouter routerConfig;

  const MyApp({super.key, required this.routerConfig});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App',
      theme: ThemeData(
        useMaterial3: true,
        extensions: [AppThemeExtension.light],
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        extensions: [AppThemeExtension.dark],
      ),
      routerConfig: routerConfig,
    );
  }
}
