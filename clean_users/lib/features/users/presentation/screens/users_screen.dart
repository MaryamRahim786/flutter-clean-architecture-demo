import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/users_provider.dart';
import 'user_detail_screen.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Something went wrong.\n$e',
            textAlign: TextAlign.center)),
        data: (users) => RefreshIndicator(
          onRefresh: () => ref.refresh(usersProvider.future),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i) {
              final user = users[i];
              return ListTile(
                leading: CircleAvatar(child: Text(user.name[0])),
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserDetailScreen(user: user),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
