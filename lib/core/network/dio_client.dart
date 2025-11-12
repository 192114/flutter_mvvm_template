import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'exceptions.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      connectTimeout: Duration(milliseconds: EnvConfig.connectTimeout),
      receiveTimeout: Duration(milliseconds: EnvConfig.receiveTimeout),
      responseType: ResponseType.json,
    ),
  );
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ),
  );
  return dio;
});

// 错误处理
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        exception = NetworkException('请求超时，请检查网络');
        break;

      case DioExceptionType.connectionError:
        exception = NetworkException('网络连接失败');
        break;

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;

        if (statusCode == 401) {
          exception = UnauthorizedException();
        } else if (statusCode != null && statusCode >= 500) {
          exception = ServerException('服务器错误（$statusCode）', statusCode);
        } else {
          exception = ServerException(
            err.response?.data?['message'] ?? '请求失败',
            statusCode,
          );
        }
        break;
      case DioExceptionType.cancel:
        exception = AppException('请求已取消');
        break;
      default:
        exception = AppException('未知错误: ${err.message}');
    }

    handler.reject(err.copyWith(error: exception));
  }
}
