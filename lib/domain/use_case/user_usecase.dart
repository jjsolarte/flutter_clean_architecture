import 'package:fluttertest/data/models/user_model.dart';
import 'package:fluttertest/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<List<User>> getUsers() async {
    return await _repository.getUsers();
  }
}
