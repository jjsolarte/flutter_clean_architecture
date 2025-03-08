import 'package:fluttertest/data/data_source/product_datasource.dart';
import 'package:fluttertest/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dataSource.getProducts();
      return response.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}