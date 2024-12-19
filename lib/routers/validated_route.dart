import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/middleware/middle_screen/error_screen.dart';
import '../presentation/middleware/middleware.dart';
import '../presentation/riverpod/data_provider/local_storage_data/local_session_data_provider.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/register_screen.dart';
import '../presentation/screens/settings/settings_screen.dart';
import '../presentation/screens/web_view/web_view_screen.dart';

List<String> get authRouteRegistered {
  return [
    SettingsScreen.path,
    WebViewScreen.path,
  ];
}

List<String> get publicRouteRegistered {
  return [
    LoginScreen.path,
    RegisterScreen.path,
  ];
}

FutureOr<String?> validateRoute({
  required BuildContext context,
  required GoRouterState state,
  required Ref<GoRouter> ref,
}) {
  final AsyncValue<LocalSessionDataState> localStorageData = ref.watch(localSessionDataEventProvider); // AsyncValue<String?>

  if (localStorageData is AsyncLoading) {
    debugPrint('Route is Loading...');
  }

  if (localStorageData is AsyncData<String?>) {
    debugPrint('Loaded Data');
    final String? token = localStorageData.value?.authToken;

    // Jika tidak ada token, periksa rute publik
    if (token == null) {
      if (state.uri.path != '/') {
        final bool isValidRoute = publicRouteRegistered.contains(state.uri.path);
        return isValidRoute ? null : Middleware.path;
      }
    }
    // Jika ada token, periksa rute yang memerlukan autentikasi
    else {
      if (state.uri.path != '/') {
        final bool isValidRoute = authRouteRegistered.contains(state.uri.path);
        return isValidRoute ? null : ErrorScreen.path;
      }
    }
  }

  if (localStorageData is AsyncError) {
    debugPrint('Error: ${localStorageData.error}');
    // Jika ada error saat membaca token, bisa diarahkan ke halaman error
    return ErrorScreen.path;
  }

  // Secara default, arahkan ke halaman 404 jika tidak ada kasus yang cocok
  return null;
}
