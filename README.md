# Flutter MVVM 模板

一个简洁的 Flutter MVVM 架构模板，开箱即用。

## ✨ 特性

- 🏗️ **MVVM 架构** - 清晰的代码分层
- 🔄 **Riverpod** - 现代化状态管理
- 🌐 **Dio** - 强大的网络请求
- 🧊 **Freezed** - 不可变数据模型
- 🚀 **GoRouter** - 声明式路由
- 💾 **SharedPreferences** - 简单本地存储

## 📁 项目结构

```
lib/
├── core/           # 核心功能（网络、存储、配置）
│   ├── config/     # 环境配置
│   ├── network/    # 网络请求和异常处理
│   └── storage/    # 本地存储
├── data/           # 数据层（模型、仓储）
│   ├── models/     # 数据模型
│   └── repositories/ # 数据仓储
├── presentation/   # 表现层（页面、组件、状态）
│   ├── widgets/    # 通用组件
│   ├── auth/       # 认证相关页面
│   └── home/       # 首页
├── routes/         # 路由配置
└── main.dart       # 应用入口
```

## 🚀 快速开始

### 1. 克隆项目
```bash
git clone <your-repo-url>
cd flutter_mvvm_template
```

### 2. 安装依赖
```bash
flutter pub get
```

### 3. 生成代码
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. 运行项目

#### 开发环境（默认）
```bash
flutter run
```

#### 或显式指定开发环境
```bash
flutter run --dart-define=ENVIRONMENT=dev
```

#### 生产环境
```bash
flutter run --dart-define=ENVIRONMENT=prod
```

#### 自定义 API 地址
```bash
flutter run \
  --dart-define=ENVIRONMENT=dev \
  --dart-define=BASE_URL=https://dev-api.example.com
```

## 📝 使用指南

### 添加新页面

1. 在 `lib/presentation/` 创建新的页面目录
2. 创建页面文件（如 `my_page.dart`）
3. 创建对应的 view_model（如 `my_page_view_model.dart`）
4. 在 `lib/routes/app_router.dart` 添加路由配置

示例：
```dart
// lib/presentation/my_feature/my_page.dart
class MyPage extends ConsumerWidget {
  const MyPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的页面')),
      body: const Center(child: Text('Hello')),
    );
  }
}
```

### 添加新接口

1. 在 `lib/data/models/` 创建数据模型（使用 Freezed）
```dart
@freezed
class MyModel with _$MyModel {
  const factory MyModel({
    required String id,
    required String name,
  }) = _MyModel;
  
  factory MyModel.fromJson(Map<String, dynamic> json) => 
      _$MyModelFromJson(json);
}
```

2. 在 `lib/data/repositories/` 添加仓储方法
```dart
class MyRepository {
  final Dio _dio;
  MyRepository(this._dio);
  
  Future<List<MyModel>> getItems() async {
    final response = await _dio.get('/items');
    return (response.data as List)
        .map((json) => MyModel.fromJson(json))
        .toList();
  }
}
```

3. 运行代码生成
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 环境配置

修改 `lib/core/config/env.dart` 配置不同环境的参数：

```dart
static String get baseUrl {
  switch (currentEnv) {
    case Environment.dev:
      return 'https://dev-api.example.com';
    case Environment.prod:
      return 'https://api.example.com';
  }
}
```

### 状态管理

使用 Riverpod Provider 管理状态：

```dart
// 简单数据获取
final dataProvider = FutureProvider<List<Model>>((ref) async {
  final repository = ref.watch(repositoryProvider);
  return repository.getData();
});

// 可变状态管理
final counterProvider = StateProvider<int>((ref) => 0);

// 复杂状态管理
final notifierProvider = AsyncNotifierProvider<MyNotifier, List<Model>>(
  MyNotifier.new,
);
```

## 🛠️ 代码生成

Freezed 和 JsonSerializable 需要运行代码生成：

```bash
# 监听文件变化，自动生成
flutter pub run build_runner watch

# 手动生成
flutter pub run build_runner build --delete-conflicting-outputs

# 清理后重新生成
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📦 打包发布

### Android
```bash
# 开发版本
flutter build apk --dart-define=ENVIRONMENT=dev

# 生产版本
flutter build apk \
  --dart-define=ENVIRONMENT=prod \
  --dart-define=BASE_URL=https://api.example.com \
  --release
```

### iOS
```bash
# 开发版本
flutter build ios --dart-define=ENVIRONMENT=dev

# 生产版本
flutter build ios \
  --dart-define=ENVIRONMENT=prod \
  --dart-define=BASE_URL=https://api.example.com \
  --release
```

## 🧪 测试

```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/example_test.dart

# 带覆盖率报告
flutter test --coverage
```

## 🎨 VS Code 调试

项目已配置 `.vscode/launch.json`，按 `F5` 或点击 Run and Debug 选择：
- **开发环境** - 使用开发环境配置运行
- **生产环境** - 使用生产环境配置运行

## 📚 技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Flutter | 3.9.2+ | UI 框架 |
| Riverpod | 3.0.3+ | 状态管理 |
| GoRouter | 16.3.0+ | 路由管理 |
| Dio | 5.9.0+ | 网络请求 |
| Freezed | 3.2.3+ | 数据模型 |
| SharedPreferences | 2.5.3+ | 本地存储 |

## 🤝 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交改动 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

## 📄 License

MIT License

---

## 💡 常见问题

### 如何修改应用名称？
修改 `pubspec.yaml` 中的 `name` 字段，然后重新生成代码。

### 如何添加新的依赖包？
1. 在 `pubspec.yaml` 中添加依赖
2. 运行 `flutter pub get`
3. 如果是需要代码生成的包，运行 `flutter pub run build_runner build`

### 代码生成失败怎么办？
```bash
# 清理缓存后重新生成
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 如何切换环境？
使用 `--dart-define=ENVIRONMENT=<env>` 参数，或使用 VS Code 的启动配置。

---

**Happy Coding! 🎉**