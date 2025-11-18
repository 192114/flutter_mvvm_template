import '../models/auth_model.dart';

abstract class AuthRepository {
  /// 登录
  Future<LoginResponse> login(String username, String password);
}
