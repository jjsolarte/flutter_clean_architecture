import 'package:flutter/material.dart';
import 'package:fluttertest/core/router/app_routes.dart';
import 'package:fluttertest/core/utils/extensions/string_extensions.dart';
import 'package:fluttertest/presentation/providers/login_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CircularProgressIndicator();
        }

        return ElevatedButton(
          onPressed: () async {
            if (!emailController.text.isValidEmail()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Correo inválido')));
              return;
            }

            await provider.login(emailController.text, passwordController.text);

            if (context.mounted) {
              if (provider.error == null) {
                context.go(AppRoutes.home);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.error!)));
              }
            }
          },
          child: const Text('Iniciar Sesión'),
        );
      },
    );
  }
}
