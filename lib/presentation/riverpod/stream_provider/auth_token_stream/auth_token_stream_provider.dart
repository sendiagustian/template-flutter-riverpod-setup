import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';

part 'auth_token_stream_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthTokenStreamEvent extends _$AuthTokenStreamEvent {
  final SessionUtil sessionUtil = SessionUtil();

  @override
  Stream<String?> build() async* {
    String? token = await sessionUtil.readSession(sessionUtil.authKey);

    if (token != null) {
      yield token;
    } else {
      yield null;
    }
  }

  set token(String? token) {
    state = AsyncData(token);
    if (token != null) {
      sessionUtil.writeSession(sessionUtil.authKey, token);
    }
  }

  void clearAuthToken() {
    state = const AsyncData(null);
    sessionUtil.clearSession();
  }
}
