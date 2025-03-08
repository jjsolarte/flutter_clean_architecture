class LoginDataSource {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Credenciales inválidas');
    }
  }
}