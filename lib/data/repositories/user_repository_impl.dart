import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_repository.dart';
import '../models/user_model.dart';
import '../datasources/user_remote_data_source.dart';
import '../../core/network/dio_client.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  const UserRepositoryImpl(this.dataSource);

  @override
  Future<List<UserModel>> getUsers() {
    return dataSource.getUsers();
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepositoryImpl(UserRemoteDataSource(dio));
});
