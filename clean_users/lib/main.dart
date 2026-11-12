import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/users/presentation/screens/users_screen.dart';

void main() => runApp(const ProviderScope(child: CleanUsersApp()));

class CleanUsersApp extends StatelessWidget {
  const CleanUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Users',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const UsersScreen(),
    );
  }
}
