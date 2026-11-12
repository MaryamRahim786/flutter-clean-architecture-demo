import '../../domain/entities/user.dart';

/// Data model: knows how to turn JSON into a domain [User].
class UserModel extends User {
  const UserModel({required super.id, required super.name, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
      );
}
