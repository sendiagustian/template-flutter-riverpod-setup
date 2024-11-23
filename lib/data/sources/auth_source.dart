import '../dtos/requests/login_request.dart';

abstract class AuthSource {
  Future<Map<String, dynamic>> login(LoginRequest request);
}

class AuthSourceImpl implements AuthSource {
  // TODO CHANGE TO POST SOURCE YOUR AUTH
  // final Dio _dio = DioClientConfig.instance.dio;
  // final String _loginPath = EndpointConst.login;

  @override
  Future<Map<String, dynamic>> login(LoginRequest request) async {
    return {
      'username': 'test',
      'role': 'admin',
      'status': 'active',
      'deviceInfo': {
        "phoneModel": "phoneModel",
        "oprationSystem": "oprationSystem",
        "cpu": "cpu",
        "serial": "serial",
        "ip": "ip",
        "sdkInt": 0,
      },
    };
    // final Response response = await _dio.post(_loginPath, data: request.toJson());

    // if (response.statusCode == 200) {
    //   return jsonDecode(response.data);
    // } else {
    //   throw Exception('Failed to Login');
    // }
  }
}
