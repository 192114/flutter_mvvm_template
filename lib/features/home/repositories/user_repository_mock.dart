import 'package:flutter_mvvm_template/features/home/models/user_model.dart';
import 'package:flutter_mvvm_template/features/home/repositories/user_mock_data.dart';
import 'package:flutter_mvvm_template/features/home/repositories/user_repository.dart';

/// 用户仓储 Mock 实现
class UserRepositoryMock implements UserRepository {
  const UserRepositoryMock();

  @override
  Future<List<UserModel>> getUsers() async {
    // 模拟网络延迟
    await UserMockData.delay();
    
    // 可选：模拟错误场景
    // throw Exception('模拟网络错误');
    
    return UserMockData.users;
  }

  /// 根据 ID 获取用户（示例扩展方法）
  Future<UserModel?> getUserById(String id) async {
    await UserMockData.delay();
    return UserMockData.getUserById(id);
  }
}