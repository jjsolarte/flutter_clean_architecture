import 'package:flutter/material.dart';

class NavBarOrganism extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBarOrganism({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Productos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Usuarios',
        ),
      ],
    );
  }
}
