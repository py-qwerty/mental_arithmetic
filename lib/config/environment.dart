enum BuildVariant { development, staging, production }


class EnvironmentConfig {
  static const String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'production');
  static const String appName = String.fromEnvironment('APP_NAME', defaultValue: 'Mental Arithmetic');
}

class Environment {
  final BuildVariant buildVariant;
  final String apiBaseUrl;
  final String supportEmail;

  // Private constructor
  Environment._(this.buildVariant, this.apiBaseUrl, this.supportEmail);

  // Static instance of Environment (singleton)
  static Environment? _instance;

  // Factory initializer to create and initialize the Environment instance
  factory Environment.init(BuildVariant variant) {
    // Set environment-specific configurations
    switch (variant) {
      case BuildVariant.development:
        _instance = Environment._(
          variant,
          'https://dev.api.example.com',
          'support-dev@example.com',
        );
        break;
      case BuildVariant.staging:
        _instance = Environment._(
          variant,
          'https://staging.api.example.com',
          'support-staging@example.com',
        );
        break;
      case BuildVariant.production:
        _instance = Environment._(
          variant,
          'https://api.example.com',
          'support@example.com',
        );
        break;
    }
    return _instance!;
  }

  // Singleton getter to access the instance
  static Environment get instance {
    if (_instance == null) {
      throw Exception('Environment not initialized. Call Environment.init() first.');
    }
    return _instance!;
  }
}
