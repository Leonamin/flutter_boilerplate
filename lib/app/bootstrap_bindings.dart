import '../core/config/app_config.dart';
import '../features/auth/data/repositories/in_memory_auth_repository.dart';
import '../features/auth/domain/repositories/auth_repository.dart';

AuthRepository createAuthRepository(AppConfig config) {
  if (config.environment != AppEnvironment.development) {
    throw UnsupportedError(
      'A real AuthRepository must be configured for staging and production.',
    );
  }
  return InMemoryAuthRepository();
}
