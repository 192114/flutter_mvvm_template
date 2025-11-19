import 'package:flutter_mvvm_template/features/auth/models/auth_model.dart';
import 'package:flutter_mvvm_template/features/auth/repositories/auth_mock_data.dart';
import 'package:flutter_mvvm_template/features/auth/repositories/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  const AuthRepositoryMock();

  @override
  Future<LoginResponse> login(String username, String password) {
    return AuthMockData.login(username, password);
  }
}
