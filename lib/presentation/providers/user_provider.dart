import 'package:flutter/material.dart';
import 'package:fluttertest/data/models/user_model.dart';
import 'package:fluttertest/domain/use_case/user_usecase.dart';

class UserProvider extends ChangeNotifier {
  final UserUseCase _useCase;

  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  UserProvider(this._useCase);

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _useCase.getUsers();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
