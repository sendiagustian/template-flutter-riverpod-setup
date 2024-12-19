import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class DioClientConfig {
  // Membuat instance static dari DioClientConfig
  static final DioClientConfig _singleton = DioClientConfig._internal();

  // Membuat instance Dio
  late Dio dio;

  // Getter untuk mengakses singleton instance
  static DioClientConfig get instance => _singleton;
  static String base = FlavorConfig.instance.variables['base'] ?? 'https://default-url.com/api/v1';

  // Method untuk mendapatkan instance Dio
  Dio get client => dio;

  // Private constructor untuk membuat Singleton Pattern
  DioClientConfig._internal() {
    // Mengambil base URL dari FlavorConfig

    dio = Dio(BaseOptions(
      baseUrl: base, // Ganti dengan base URL API yang sesuai
      connectTimeout: const Duration(seconds: 60), // timeout dalam milidetik
      receiveTimeout: const Duration(seconds: 40), // timeout dalam milidetik
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Menambahkan Interceptor untuk logging request dan response
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('Request [${options.method}] => PATH: ${options.uri}');
        return handler.next(options); // Teruskan request
      },
      onResponse: (response, handler) {
        debugPrint('Response [${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response); // Teruskan response
      },
      onError: (DioException e, handler) {
        debugPrint('Error [${e.response?.statusCode}] => MESSAGE: ${e.message}');
        return handler.next(e); // Teruskan error
      },
    ));
  }
}
