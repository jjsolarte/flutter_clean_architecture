import 'package:fluttertest/data/data_source/user_datasource.dart';
import 'package:fluttertest/data/models/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await _dataSource.getUsers();
      return response.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
