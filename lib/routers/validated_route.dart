import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/register_screen.dart';
import '../presentation/screens/web_view/web_view_screen.dart';

List<String> get authRouteRegistered {
  return [
    '/test',
    WebViewScreen.path,
  ];
}

List<String> get publicRouteRegistered {
  return [
    LoginScreen.path,
    RegisterScreen.path,
  ];
}
