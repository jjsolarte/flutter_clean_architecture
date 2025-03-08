import 'package:flutter/material.dart';
import 'package:fluttertest/data/models/product_model.dart';
import 'package:fluttertest/domain/use_case/product_usecase.dart';

class ProductProvider extends ChangeNotifier {
  final ProductUseCase _useCase;

  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  ProductProvider(this._useCase);

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _useCase.getProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
