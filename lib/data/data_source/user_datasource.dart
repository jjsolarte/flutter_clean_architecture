import 'package:dio/dio.dart';
import 'package:fluttertest/core/constants/end_points.dart';

class UserDataSource {
  final Dio _dio;

  UserDataSource(this._dio);

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await _dio.get(EndPoints.usersUrl);
      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception('Failed to load users');
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
