import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:mobiletemplate/core/shared/app.dart';

class JwtUtil {
  // Key rahasia untuk meng-sign token
  static const String _secretKey = App.screet;

  // Membuat JWT
  String generateToken(Map<String, dynamic> payload, {int? expiryMinutes}) {
    final jwt = JWT(
      payload,
      issuer: 'monica',
    );

    // Menandatangani JWT dengan kunci rahasia dan menentukan waktu kadaluwarsa
    final token = jwt.sign(
      SecretKey(_secretKey),
      expiresIn: expiryMinutes != null ? Duration(minutes: expiryMinutes) : null,
    );

    return token;
  }

  // Memverifikasi JWT
  Map<String, dynamic>? verifyToken(String token) {
    try {
      // Memverifikasi token menggunakan kunci rahasia
      final jwt = JWT.verify(token, SecretKey(_secretKey));

      // Mengembalikan payload dari token jika verifikasi berhasil
      return jwt.payload as Map<String, dynamic>;
    } on JWTExpiredException {
      debugPrint('Token expired');
    } on JWTException catch (ex) {
      debugPrint('Error verifying token: $ex');
    }

    // Jika verifikasi gagal, kembalikan null
    return null;
  }

  // Mendekode JWT tanpa verifikasi (hati-hati saat menggunakan ini)
  Map<String, dynamic>? decodeToken(String token) {
    try {
      final jwt = JWT.decode(token);
      return jwt.payload as Map<String, dynamic>;
    } catch (e) {
      debugPrint('Error decoding token: $e');
      return null;
    }
  }
}
