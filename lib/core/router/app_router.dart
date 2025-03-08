import 'package:flutter/material.dart';
import 'package:fluttertest/core/router/app_routes.dart';
import 'package:fluttertest/data/models/product_model.dart';
import 'package:fluttertest/presentation/feature/home/home_screen.dart';
import 'package:fluttertest/presentation/feature/login/login_screen.dart';
import 'package:fluttertest/presentation/feature/product/product_detail_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.productDetail,
        name: 'productDetail',
        builder: (context, state) {
          final product = state.extra as Product?;

          return ProductDetailScreen(product: product!);
        },
      ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(child: Text('Ruta no encontrada: ${state.uri.path}')),
        ),
  );
}
