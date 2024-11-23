import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/session_util.dart';

part 'auth_token_stream_provider.g.dart';

@riverpod
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
