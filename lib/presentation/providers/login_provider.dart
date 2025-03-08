import 'package:flutter/foundation.dart';
import 'package:fluttertest/domain/use_case/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _useCase;

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;

  String? get error => _error;

  LoginProvider(this._useCase);

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _useCase.execute(email, password);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
