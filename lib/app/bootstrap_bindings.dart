import 'package:flutter_boilerplate/core/config/app_config.dart';
import 'package:flutter_boilerplate/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart';

AuthRepository createAuthRepository(AppConfig config) {
  if (config.environment != AppEnvironment.development) {
    throw UnsupportedError(
      'A real AuthRepository must be configured for staging and production.',
    );
  }
  return InMemoryAuthRepository();
}
