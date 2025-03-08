import 'package:flutter/material.dart';
import 'package:fluttertest/core/router/app_routes.dart';
import 'package:fluttertest/data/data_source/home_provider.dart';
import 'package:fluttertest/presentation/feature/product/product_screen.dart';
import 'package:fluttertest/presentation/feature/users/user_screen.dart';
import 'package:fluttertest/presentation/organism/app_bar_organism.dart';
import 'package:fluttertest/presentation/organism/nav_bar_organism.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> _children = const [ProductScreen(), UserScreen()];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBarOrganism(
            title: 'Inicio',
            onLogout: () => context.go(AppRoutes.login),
          ),
          body: _children[provider.currentIndex],
          bottomNavigationBar: NavBarOrganism(
            currentIndex: provider.currentIndex,
            onTap: (index) => provider.updateIndex(index),
          ),
        );
      },
    );
  }
}
