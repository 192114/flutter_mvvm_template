import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/config/env.dart';

void main() {
  // 初始化了消息循环和其他基础设施，这样你就可以创建和交互 Future 和 Stream 等。
  // 对于使用了插件的应用程序，确保插件的初始化工作已经完成，确保可以在插件和平台代码之间正确地交互数据。
  // 因为di.init 是异步操作 所以需要 调用该方法
  WidgetsFlutterBinding.ensureInitialized();

  // 默认开发环境
  EnvConfig.setEnvironment(Environment.dev);

  runApp(const ProviderScope(child: MainApp()));
}
