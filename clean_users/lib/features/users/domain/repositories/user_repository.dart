import '../entities/user.dart';

/// Abstract contract. The domain depends on this, not on any API/DB.
abstract class UserRepository {
  Future<List<User>> getUsers();
}
