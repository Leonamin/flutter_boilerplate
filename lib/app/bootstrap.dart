import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/bootstrap_bindings.dart';
import 'package:flutter_boilerplate/app/providers/app_config_provider.dart';
import 'package:flutter_boilerplate/core/config/app_config.dart';
import 'package:flutter_boilerplate/core/observability/app_logger.dart';
import 'package:flutter_boilerplate/features/auth/application/providers/auth_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void bootstrap() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      AppLogger.error(details.exception, details.stack ?? StackTrace.current);
    };
    PlatformDispatcher.instance.onError = (error, stackTrace) {
      AppLogger.error(error, stackTrace);
      return true;
    };

    final appConfig = AppConfig.fromEnvironment();
    final authRepository = createAuthRepository(appConfig);
    runApp(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(appConfig),
          authRepositoryProvider.overrideWith((ref) {
            ref.onDispose(authRepository.dispose);
            return authRepository;
          }),
        ],
        child: const App(),
      ),
    );
  }, AppLogger.error);
}
