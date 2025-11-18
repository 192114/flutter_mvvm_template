import 'package:flutter_mvvm_template/core/config/env.dart';
import 'package:flutter_mvvm_template/data/models/auth_model.dart';

import 'auth_repository.dart';
import 'auth_repository_mock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<LoginResponse> login(String username, String password) {
    throw UnimplementedError('真实登录接口待实现');
  }
}

final authRepositoryProvider = Provider((ref) {
  if (EnvConfig.isMock) {
    return const AuthRepositoryMock();
  }

  return const AuthRepositoryImpl();
});
