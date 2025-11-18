import '../models/auth_model.dart';
import '../mock/auth_mock_data.dart';
import 'auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  const AuthRepositoryMock();

  @override
  Future<LoginResponse> login(String username, String password) {
    return AuthMockData.login(username, password);
  }
}
