import 'package:flutter/material.dart';
import 'package:fluttertest/presentation/feature/login/widgets/input_field_widget.dart';
import 'package:fluttertest/presentation/feature/login/widgets/login_button_widget.dart';
import 'package:fluttertest/presentation/feature/login/widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 50),
            InputField(controller: emailController, label: 'Correo electrónico', keyboardType: TextInputType.emailAddress),
            InputField(controller: passwordController, label: 'Contraseña', obscureText: true),
            const SizedBox(height: 20),
            LoginButton(emailController: emailController, passwordController: passwordController),
          ],
        ),
      ),
    );
  }
}
