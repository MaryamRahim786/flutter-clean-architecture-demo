import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_users.dart';

/// Dependency injection with Riverpod: each layer is wired here.
final httpClientProvider = Provider<http.Client>((ref) => http.Client());

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final client = ref.watch(httpClientProvider);
  return UserRepositoryImpl(UserRemoteDataSourceImpl(client));
});

final getUsersProvider = Provider<GetUsers>((ref) {
  return GetUsers(ref.watch(userRepositoryProvider));
});

/// The screen watches this. It handles loading / error / data for free.
final usersProvider = FutureProvider<List<User>>((ref) {
  return ref.watch(getUsersProvider).call();
});
