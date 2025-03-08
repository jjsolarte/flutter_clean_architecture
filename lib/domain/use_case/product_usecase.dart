import 'package:fluttertest/data/models/product_model.dart';
import 'package:fluttertest/domain/repositories/product_repository.dart';

class ProductUseCase {
  final ProductRepository _repository;

  ProductUseCase(this._repository);

  Future<List<Product>> getProducts() async {
    return await _repository.getProducts();
  }
}
