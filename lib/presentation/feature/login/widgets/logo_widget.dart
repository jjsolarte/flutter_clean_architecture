import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://your-logo-url.com/logo.png',
        height: MediaQuery.of(context).size.height * 2 / 5,
        errorBuilder: (context, error, stackTrace) {
          return FlutterLogo(size: MediaQuery.of(context).size.height * 2 / 5);
        },
      ),
    );
  }
}
