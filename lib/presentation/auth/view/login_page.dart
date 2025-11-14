import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/router.dart';
import '../../../core/theme/theme_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final currentTheme = ref.watch(themeModeProvider);
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.push(AppRoutes.home);
            },
            child: const Text('登录'),
          ),
          OutlinedButton(
            onPressed: () {
              themeNotifier.toggleTheme();
            },
            child: const Text('切换主题'),
          ),
          Text(currentTheme.toString())
        ],
      ),
    );
  }
}
