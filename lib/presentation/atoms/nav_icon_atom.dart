import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const NavIcon({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: isActive ? Theme.of(context).primaryColor : Colors.grey,
      onPressed: onTap,
    );
  }
}
