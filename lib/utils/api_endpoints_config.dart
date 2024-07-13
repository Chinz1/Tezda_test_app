enum Environment { development, production }

class AppConfig {
  AppConfig._();

  static late Map<String, String> _constants;

  static bool isProd = false;

  static void setEnvironment(Environment environment) {
    switch (environment) {
      case Environment.development:
        _constants = _Constants.developmentConstants;
        isProd = false;
        break;

      case Environment.production:
        _constants = _Constants.prodConstants;
        isProd = true;
        break;
    }
  }

  static String get baseUrl {
    return _constants[_Constants.baseUrl]!;
  }

  static String get appName {
    return _constants[_Constants.appName]!;
  }
}

class _Constants {
  static const baseUrl = 'BASE_URL';
  static const appName = 'APP_NAME';

  static Map<String, String> developmentConstants = {
    baseUrl: 'https://healthtracker-backend-kic4.onrender.com/docs',
    appName: 'Pixel test',
  };

  static Map<String, String> prodConstants = {
    baseUrl: 'https://healthtracker-backend-kic4.onrender.com/docs',
    appName: 'Pixel test',
  };
}
