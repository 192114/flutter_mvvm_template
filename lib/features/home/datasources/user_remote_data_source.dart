import 'package:dio/dio.dart';
import 'package:flutter_mvvm_template/core/network/exceptions.dart';
import 'package:flutter_mvvm_template/core/utils/logger.dart';
import 'package:flutter_mvvm_template/features/home/models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;
  const UserRemoteDataSource(this.dio);

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get('/users');
    final data = (response.data as List).map((item) => UserModel.fromJson(item)).toList();

    return data;
    } on DioException catch (e, stackTrace) {
      AppLogger.e('获取用户列表失败: ${e.message}', stackTrace);
      throw AppException('获取用户列表失败: ${e.message}', e.response?.statusCode);
    } catch (e, stackTrace) {
      AppLogger.e('数据解析失败: $e', stackTrace);
      throw AppException('数据解析失败: $e', null);
    }
  }
}