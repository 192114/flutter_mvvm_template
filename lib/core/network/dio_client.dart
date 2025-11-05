import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/env.dart';

class DioClient {
  late final Dio _dio;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.baseUrl,
        connectTimeout: Duration(milliseconds: EnvConfig.connectTimeout),
        receiveTimeout: Duration(milliseconds: EnvConfig.receiveTimeout),
        responseType: ResponseType.json,
      ),
    );

    // pretter_dio_logger 美化打印输出
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }

  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  Dio get dio => _dio;
}
