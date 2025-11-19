import 'package:flutter_mvvm_template/features/auth/models/auth_model.dart';

class AuthMockData {
  AuthMockData._();

  // 模拟网络延迟
  static Future<void> delay([int milliseconds = 800]) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  }

  // 模拟用户数据库
  static final Map<String, Map<String, dynamic>> _users = {
    'admin': {
      'password': '123456',
      'user': const UserInfo(
        id: '1',
        username: 'admin',
        email: 'admin@example.com',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin',
      ),
    },
    'test': {
      'password': '123456',
      'user': const UserInfo(
        id: '2',
        username: 'test',
        email: 'test@example.com',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=test',
      ),
    },
    'zhangsan': {
      'password': '123456',
      'user': const UserInfo(
        id: '3',
        username: 'zhangsan',
        email: 'zhangsan@example.com',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhangsan',
      ),
    },
  };

  // 模拟登录
  static Future<LoginResponse> login(String username, String password) async {
    await delay();

    if (!_users.containsKey(username)) {
      throw Exception('用户名不存在');
    }

    final userData = _users[username]!;

    if (userData['password'] != password) {
      throw Exception('密码错误');
    }

    // 生成模拟token
    final accessToken =
        'mock_access_token_${username}_${DateTime.now().millisecondsSinceEpoch}';
    final refreshToken =
        'mock_refresh_token_${username}_${DateTime.now().millisecondsSinceEpoch}';

    return LoginResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: userData['user'] as UserInfo,
    );
  }
}
