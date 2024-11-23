import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'constants/enums/type_enums.dart';
import 'middleware/middle_screen/not_found_screen.dart';
import 'middleware/middleware.dart';
import 'screens/auth/login_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/web_view/web_view_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Middleware.path,
    routes: [
      // Parent Route / Middleware
      GoRoute(
        path: Middleware.path, name: Middleware.name, builder: (context, state) => const Middleware(),
        // Child Routes of Middleware
        routes: [
          // Route SplashScreen
          GoRoute(
            path: SplashScreen.path,
            name: SplashScreen.name,
            builder: (context, state) => const SplashScreen(),
          ),
          // Route LoginScreen
          GoRoute(
            path: LoginScreen.path,
            name: LoginScreen.name,
            builder: (context, state) => const LoginScreen(),
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
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
