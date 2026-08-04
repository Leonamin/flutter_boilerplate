enum AppEnvironment { development, staging, production }

final class AppConfig {
  const AppConfig({required this.environment, this.apiBaseUrl});

  factory AppConfig.fromEnvironment() {
    const environmentName = String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'development',
    );
    const apiBaseUrlValue = String.fromEnvironment('API_BASE_URL');

    return AppConfig.fromValues(
      environmentName: environmentName,
      apiBaseUrlValue: apiBaseUrlValue,
    );
  }

  factory AppConfig.fromValues({
    String environmentName = 'development',
    String apiBaseUrlValue = '',
  }) {
    final environment = switch (environmentName) {
      'development' => AppEnvironment.development,
      'staging' => AppEnvironment.staging,
      'production' => AppEnvironment.production,
      _ => throw ArgumentError.value(
        environmentName,
        'APP_ENV',
        'Unsupported value',
      ),
    };

    return AppConfig(
      environment: environment,
      apiBaseUrl: _parseApiBaseUrl(apiBaseUrlValue),
    );
  }

  final AppEnvironment environment;
  final Uri? apiBaseUrl;

  static Uri? _parseApiBaseUrl(String value) {
    if (value.isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(value);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      throw ArgumentError.value(
        value,
        'API_BASE_URL',
        'Must be an absolute URL',
      );
    }
    return uri;
  }
}
