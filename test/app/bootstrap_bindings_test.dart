import 'package:flutter_boilerplate/app/bootstrap_bindings.dart';
import 'package:flutter_boilerplate/core/config/app_config.dart';
import 'package:flutter_boilerplate/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('uses the in-memory auth adapter only in development', () {
    final repository = createAuthRepository(
      AppConfig.fromValues(environmentName: 'development'),
    );
    addTearDown(repository.dispose);

    expect(repository, isA<InMemoryAuthRepository>());
  });

  test('fails fast until a staging or production auth adapter is bound', () {
    expect(
      () => createAuthRepository(
        AppConfig.fromValues(environmentName: 'staging'),
      ),
      throwsUnsupportedError,
    );
    expect(
      () => createAuthRepository(
        AppConfig.fromValues(environmentName: 'production'),
      ),
      throwsUnsupportedError,
    );
  });
}
