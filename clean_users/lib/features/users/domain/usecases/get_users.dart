import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// One use-case = one piece of business logic the UI can call.
class GetUsers {
  final UserRepository repository;
  const GetUsers(this.repository);

  Future<List<User>> call() => repository.getUsers();
}
