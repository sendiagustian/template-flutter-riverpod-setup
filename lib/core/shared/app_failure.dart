import 'package:dio/dio.dart';

// Abstract class untuk failure, agar bisa digunakan di seluruh aplikasi
abstract class AppFailure {
  final String message;

  AppFailure(this.message);

  @override
  String toString() => message;
}

// General failure untuk error yang tidak diketahui atau default
class GeneralFailure extends AppFailure {
  GeneralFailure(super.message);
}

// Kesalahan akibat masalah jaringan
class NetworkFailure extends AppFailure {
  NetworkFailure(super.message);
}

// Kesalahan dari server
class ServerFailure extends AppFailure {
  ServerFailure(super.message);
}

// Kesalahan saat permintaan tidak ditemukan (404)
class NotFoundFailure extends AppFailure {
  NotFoundFailure() : super('Resource not found');
}

// Kesalahan terkait dengan otorisasi atau autentikasi
class UnauthorizedFailure extends AppFailure {
  UnauthorizedFailure() : super('Unauthorized access');
}

// Kesalahan untuk permintaan yang tidak valid (400)
class BadRequestFailure extends AppFailure {
  BadRequestFailure() : super('Bad request, please check your input');
}

// Fungsi untuk memetakan DioError ke dalam AppFailure
AppFailure handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return NetworkFailure('Connection timed out. Please try again.');
    case DioExceptionType.sendTimeout:
      return NetworkFailure('Send timeout. Please try again.');
    case DioExceptionType.receiveTimeout:
      return NetworkFailure('Receive timeout. Please try again.');
    case DioExceptionType.badResponse:
      // Jika ada respon, cek status kode untuk menentukan jenis error
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestFailure();
          case 401:
            return UnauthorizedFailure();
          case 404:
            return NotFoundFailure();
          case 500:
            return ServerFailure('Internal server error. Please try again later.');
          default:
            return ServerFailure('Received invalid status code: ${error.response!.statusCode}');
        }
      }
      return GeneralFailure('Unknown error occurred. Please try again.');
    case DioExceptionType.cancel:
      return GeneralFailure('Request to server was cancelled');
    case DioExceptionType.unknown:
      return NetworkFailure('No internet connection. Please check your connection.');
    default:
      return GeneralFailure('An unexpected error occurred. Please try again.');
  }
}
