import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/di/dependency_injection.dart';
import 'package:flutter_boilerplate/core/routes/app_router.dart';
import 'package:flutter_boilerplate/core/theme/app_colors.dart';
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
      debugShowCheckedModeBanner: false,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
            Logger.debug('locale: $locale', tag: 'MyApp');
            Logger.debug('supportedLocales: $supportedLocales', tag: 'MyApp');
            if (locale == null) return const Locale('en'); // 기본 로케일 설정

            // 우선순위 1: 언어코드 + 스크립트코드 + 지역코드 모두 일치 (모두 non-null)
            for (var supportedLocale in supportedLocales) {
              if (locale.languageCode == supportedLocale.languageCode &&
                  locale.scriptCode != null &&
                  locale.scriptCode == supportedLocale.scriptCode &&
                  locale.countryCode != null &&
                  locale.countryCode == supportedLocale.countryCode) {
                Logger.debug(
                  'Matched priority 1: $supportedLocale',
                  tag: 'MyApp',
                );
                return supportedLocale;
              }
            }

            // 우선순위 2: 언어코드 + 스크립트코드 일치 (스크립트코드 non-null)
            for (var supportedLocale in supportedLocales) {
              if (locale.languageCode == supportedLocale.languageCode &&
                  locale.scriptCode != null &&
                  locale.scriptCode == supportedLocale.scriptCode) {
                Logger.debug(
                  'Matched priority 2: $supportedLocale',
                  tag: 'MyApp',
                );
                return supportedLocale;
              }
            }

            // 우선순위 3: 언어코드 + 지역코드 일치 (지역코드 non-null)
            for (var supportedLocale in supportedLocales) {
              if (locale.languageCode == supportedLocale.languageCode &&
                  locale.countryCode != null &&
                  locale.countryCode == supportedLocale.countryCode) {
                Logger.debug(
                  'Matched priority 3: $supportedLocale',
                  tag: 'MyApp',
                );
                return supportedLocale;
              }
            }

            // 우선순위 4: 언어코드만 일치
            for (var supportedLocale in supportedLocales) {
              if (locale.languageCode == supportedLocale.languageCode) {
                Logger.debug(
                  'Matched priority 4: $supportedLocale',
                  tag: 'MyApp',
                );
                return supportedLocale;
              }
            }

            // 우선순위 5: 기본 언어 (영어)
            Logger.debug('Using default locale: en', tag: 'MyApp');
            return const Locale('en');
          },
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        extensions: [AppThemeExtension.light],
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          // Primary colors (검정 스케일)
          primary: AppColors.gray900,
          onPrimary: AppColors.white,
          primaryContainer: AppColors.gray100,
          onPrimaryContainer: AppColors.gray900,
          // Secondary colors (브랜드 색상)
          secondary: AppColors.primary500,
          onSecondary: AppColors.white,
          secondaryContainer: AppColors.primary50,
          onSecondaryContainer: AppColors.primary900,
          // Tertiary colors (액센트 색상)
          tertiary: AppColors.accent500,
          onTertiary: AppColors.black,
          tertiaryContainer: AppColors.accent50,
          onTertiaryContainer: AppColors.accent900,
          // Error colors
          error: AppColors.error500,
          onError: AppColors.white,
          errorContainer: AppColors.error50,
          onErrorContainer: AppColors.error900,
          // Background colors
          surface: AppColors.white,
          onSurface: AppColors.gray900,
          surfaceContainerHighest: AppColors.gray100,
          onSurfaceVariant: AppColors.gray700,
          // Outline colors
          outline: AppColors.gray300,
          outlineVariant: AppColors.gray200,
          // Shadow & Scrim
          shadow: AppColors.black,
          scrim: AppColors.black,
          // Inverse colors
          inverseSurface: AppColors.gray900,
          onInverseSurface: AppColors.white,
          inversePrimary: AppColors.gray200,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        extensions: [AppThemeExtension.dark],
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          // Primary colors (검정 스케일 - 다크모드 반전)
          primary: AppColors.white,
          onPrimary: AppColors.gray900,
          primaryContainer: AppColors.gray800,
          onPrimaryContainer: AppColors.gray100,
          // Secondary colors (브랜드 색상)
          secondary: AppColors.primary400,
          onSecondary: AppColors.white,
          secondaryContainer: AppColors.primary900,
          onSecondaryContainer: AppColors.primary50,
          // Tertiary colors (액센트 색상)
          tertiary: AppColors.accent400,
          onTertiary: AppColors.black,
          tertiaryContainer: AppColors.accent900,
          onTertiaryContainer: AppColors.accent50,
          // Error colors
          error: AppColors.error400,
          onError: AppColors.white,
          errorContainer: AppColors.error900,
          onErrorContainer: AppColors.error50,
          // Background colors
          surface: AppColors.gray900,
          onSurface: AppColors.white,
          surfaceContainerHighest: AppColors.gray800,
          onSurfaceVariant: AppColors.gray300,
          // Outline colors
          outline: AppColors.gray600,
          outlineVariant: AppColors.gray700,
          // Shadow & Scrim
          shadow: AppColors.black,
          scrim: AppColors.black,
          // Inverse colors
          inverseSurface: AppColors.gray100,
          onInverseSurface: AppColors.gray900,
          inversePrimary: AppColors.gray800,
        ),
      ),
      routerConfig: routerConfig,
    );
  }
}
