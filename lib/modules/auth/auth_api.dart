import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';

class AuthApiService {
  final Dio _dio = DioClient.dio;

  Future<String?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        return response.data['access_token'] as String?;
      }

      return null;
    } on DioException catch (e) {
      final message = e.response?.data ?? e.message;
      throw Exception('Login failed: $message');
    }
  }


  Future<String?> signup(String name, String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        return response.data['access_token'] as String?;
      }

      return null;
    } on DioException catch (e) {
      final message = e.response?.data ?? e.message;
      throw Exception('Signup failed: $message');
    }
  }
}
