import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/constants/enums/type_enums.dart';
import '../presentation/middleware/middle_screen/not_found_screen.dart';
import '../presentation/middleware/middleware.dart';
import '../presentation/screens/settings/settings_screen.dart';
import 'validated_route.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/register_screen.dart';
import '../presentation/screens/web_view/web_view_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Middleware.path,
    errorPageBuilder: (context, state) => const MaterialPage(child: NotFoundScreen()),
    redirect: (context, state) => validateRoute(context: context, state: state, ref: ref),
    routes: [
      // Parent Route / Middleware
      GoRoute(
        path: Middleware.path, name: Middleware.name, builder: (context, state) => const Middleware(),
        // Child Routes of SplashScreen
        routes: [
          GoRoute(
            path: SettingsScreen.path,
            name: SettingsScreen.name,
            builder: (context, state) => const SettingsScreen(),
          ),
          // Route WebViewScreen
          GoRoute(
            path: WebViewScreen.path,
            name: WebViewScreen.name,
            builder: (context, state) {
              final title = state.uri.queryParameters['title']!;
              final url = state.uri.queryParameters['url']!;
              final orientation = state.extra as OrientationType;
              return WebViewScreen(title: title, url: url, orientation: orientation);
            },
          ),
        ],
      ),
      // Route LoginScreen
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      // Route RegisterScreen
      GoRoute(
        path: RegisterScreen.path,
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
});
