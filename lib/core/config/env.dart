import '../utils/logger.dart';

/// dev: 开发环境
/// prod: 生产环境
enum Environment { dev, prod }

class EnvConfig {
  // 从编译参数读取环境变量
  static const String _envString = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );

  static Environment get currentEnv {
    switch (_envString) {
      case 'prod':
      case 'production':
        return Environment.prod;
      case 'dev':
      case 'development':
      default:
        return Environment.dev;
    }
  }

  static String get baseUrl {
    switch (currentEnv) {
      case Environment.dev:
        return const String.fromEnvironment(
          'BASE_URL',
          defaultValue: 'https://localhost:8899',
        );
      case Environment.prod:
        return const String.fromEnvironment(
          'BASE_URL',
          defaultValue: 'https://api.example.com',
        );
    }
  }

  static const int connectTimeout = int.fromEnvironment(
    'CONNECT_TIMEOUT',
    defaultValue: 30000,
  );

  static const int receiveTimeout = int.fromEnvironment(
    'RECEIVE_TIMEOUT',
    defaultValue: 30000,
  );

  static bool get isProduction => currentEnv == Environment.prod;
  static bool get isDevelopment => currentEnv == Environment.dev;

  // 调试信息
  static void printConfig() {
    AppLogger.i('========== 环境配置 ==========');
    AppLogger.i('Environment: $_envString (${currentEnv.name})');
    AppLogger.i('Base URL: $baseUrl');
    AppLogger.i('Connect Timeout: $connectTimeout ms');
    AppLogger.i('Receive Timeout: $receiveTimeout ms');
    AppLogger.i('Is Production: $isProduction');
    AppLogger.i('==============================');
  }
}
