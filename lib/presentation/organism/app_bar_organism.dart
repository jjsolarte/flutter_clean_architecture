import 'package:flutter/material.dart';
import 'package:fluttertest/presentation/atoms/app_bar_title_atom.dart';

class AppBarOrganism extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onLogout;

  const AppBarOrganism({
    super.key,
    required this.title,
    required this.onLogout,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppBarTitle(title: title),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: onLogout,
        )
      ],
    );
  }
}
