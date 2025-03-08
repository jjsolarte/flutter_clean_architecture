import 'package:dio/dio.dart';
import 'package:fluttertest/core/constants/end_points.dart';

class ProductDataSource {
  final Dio _dio;

  ProductDataSource(this._dio);

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await _dio.get(EndPoints.productsUrl);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception('Failed to load product');
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
