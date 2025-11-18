import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_repository.dart';
import '../models/user_model.dart';
import '../datasources/user_remote_data_source.dart';
import '../../core/network/dio_client.dart';

// 引入mock数据
import 'user_repository_mock.dart';
import '../../core/config/env.dart'; 

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  const UserRepositoryImpl(this.dataSource);

  @override
  Future<List<UserModel>> getUsers() {
    return dataSource.getUsers();
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  if (EnvConfig.isMock) {
    return const UserRepositoryMock();
  }

  final dio = ref.watch(dioProvider);
  return UserRepositoryImpl(UserRemoteDataSource(dio));
});
