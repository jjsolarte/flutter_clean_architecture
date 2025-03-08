class AppRoutes {
  static const login = '/';
  static const home = '/home';
  static const productDetail = '/product/:id';

  static const productIdParam = 'id';

  static String productDetailPath(String productId) => '/product/$productId';
}
