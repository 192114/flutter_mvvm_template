import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
