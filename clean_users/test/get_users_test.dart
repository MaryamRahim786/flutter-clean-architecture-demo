import 'package:clean_users/features/users/domain/entities/user.dart';
import 'package:clean_users/features/users/domain/repositories/user_repository.dart';
import 'package:clean_users/features/users/domain/usecases/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUsers useCase;
  late MockUserRepository repository;

  setUp(() {
    repository = MockUserRepository();
    useCase = GetUsers(repository);
  });

  test('GetUsers returns the list from the repository', () async {
    const users = [User(id: 1, name: 'Maryam', email: 'm@example.com')];
    when(() => repository.getUsers()).thenAnswer((_) async => users);

    final result = await useCase();

    expect(result, users);
    verify(() => repository.getUsers()).called(1);
  });
}
