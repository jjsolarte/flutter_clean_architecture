import 'package:fluttertest/data/data_source/login_datasource.dart';

abstract class LoginRepository {
  Future<void> login(String email, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _dataSource;

  LoginRepositoryImpl(this._dataSource);

  @override
  Future<void> login(String email, String password) async {
    try {
      await _dataSource.login(email, password);
    } catch (e) {
      throw Exception('Error en login: $e');
    }
  }
}
