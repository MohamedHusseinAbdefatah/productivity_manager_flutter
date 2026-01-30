import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000', // Android emulator
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
}
