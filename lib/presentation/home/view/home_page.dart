import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme_provider.dart';

import '../view_model/home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: switch (usersState) {
                AsyncData(:final value) => ListView.builder(
                  itemBuilder: (context, index) =>
                      ListTile(title: Text(value[index].name)),
                  itemCount: value.length,
                ),
                AsyncLoading() => const Center(child: Text('loading')),
                AsyncError(:final error) => Center(
                  child: Text('Error: $error'),
                ),
              },
            ),
            ElevatedButton(
              onPressed: () {
                themeNotifier.toggleTheme();
              },
              child: const Text('切换主题'),
            ),
          ],
        ),
      ),
    );
  }
}
