import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;
  const UserRemoteDataSource(this.dio);

  Future<List<UserModel>> getUsers() async {
    final response = await dio.get('/users');
    final data = (response.data as List).map((item) => UserModel.fromJson(item)).toList();

    return data;
  }
}