import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';

/// Implements the domain contract using the remote data source.
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;
  const UserRepositoryImpl(this.remote);

  @override
  Future<List<User>> getUsers() => remote.fetchUsers();
}
