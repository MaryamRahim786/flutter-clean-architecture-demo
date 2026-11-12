import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.email_outlined, size: 18),
              const SizedBox(width: 8),
              Text(user.email),
            ]),
          ],
        ),
      ),
    );
  }
}
