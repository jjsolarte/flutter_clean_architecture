import 'package:fluttertest/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<void> execute(String email, String password) async {
    return await _repository.login(email, password);
  }
}
