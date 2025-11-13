/// dev: 开发环境
/// prod: 生产环境
enum Environment { dev, prod }

class EnvConfig {
  static Environment _currentEnv = Environment.dev;

  static void setEnvironment(Environment env) {
    _currentEnv = env;
  }

  static String get baseUrl {
    switch (_currentEnv) {
      case Environment.dev:
        return 'https://localhost:8899';
      case Environment.prod:
        return 'https://api.example.com';
    }
  }

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  static bool get isProduction => _currentEnv == Environment.prod;
  static bool get isDevelopment => _currentEnv == Environment.dev;
}
