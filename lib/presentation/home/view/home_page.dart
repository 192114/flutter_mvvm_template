import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersProvider);
    return Scaffold(
      body: switch (usersState) {
        AsyncData(:final value) => ListView.builder(
          itemBuilder: (context, index) =>
              ListTile(title: Text(value[index].name)),
        ),
        AsyncLoading() => const Center(child: Text('loading')),
        AsyncError(:final error) => Center(child: Text('Error: $error')),
      },
    );
  }
}
