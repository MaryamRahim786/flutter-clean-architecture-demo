import 'package:clean_users/features/users/domain/entities/user.dart';
import 'package:clean_users/features/users/presentation/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UserDetailScreen shows the user name and email', (tester) async {
    const user = User(id: 1, name: 'Maryam', email: 'm@example.com');

    await tester.pumpWidget(
      const MaterialApp(home: UserDetailScreen(user: user)),
    );

    expect(find.text('Maryam'), findsWidgets);
    expect(find.text('m@example.com'), findsOneWidget);
  });
}
