import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config/app_config.dart';
import '../core/observability/app_logger.dart';
import '../features/auth/application/providers/auth_repository_provider.dart';
import 'app.dart';
import 'bootstrap_bindings.dart';
import 'providers/app_config_provider.dart';

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
