import 'package:flutter_boilerplate/core/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConfig', () {
    test('parses supported environment values', () {
      final config = AppConfig.fromValues(
        environmentName: 'staging',
        apiBaseUrlValue: 'https://api.example.com/v1',
      );

      expect(config.environment, AppEnvironment.staging);
      expect(config.apiBaseUrl, Uri.parse('https://api.example.com/v1'));
    });

    test('rejects unsupported environment values', () {
      expect(
        () => AppConfig.fromValues(environmentName: 'preview'),
        throwsArgumentError,
      );
    });

    test('rejects a relative API base URL', () {
      expect(
        () => AppConfig.fromValues(apiBaseUrlValue: '/api'),
        throwsArgumentError,
      );
    });
  });
}
