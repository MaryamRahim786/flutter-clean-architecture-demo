import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/failure.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> fetchUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  const UserRemoteDataSourceImpl(this.client);

  static const _url = 'https://jsonplaceholder.typicode.com/users';

  @override
  Future<List<UserModel>> fetchUsers() async {
    final res = await client.get(Uri.parse(_url));
    if (res.statusCode != 200) {
      throw const Failure('Failed to load users');
    }
    final list = jsonDecode(res.body) as List<dynamic>;
    return list
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
