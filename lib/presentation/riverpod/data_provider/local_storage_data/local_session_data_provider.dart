import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/session_util.dart';

part 'local_session_data_provider.g.dart';

class LocalSessionData {
  final String? authToken;
  final String? userToken;

  LocalSessionData({
    this.authToken,
    this.userToken,
  });

  LocalSessionData copyWith({
    String? authToken,
    String? userToken,
  }) {
    return LocalSessionData(
      authToken: authToken ?? this.authToken,
      userToken: userToken ?? this.userToken,
    );
  }
}

@Riverpod(keepAlive: true)
class LocalSessionDataEvent extends _$LocalSessionDataEvent {
  final SessionUtil _sessionUtil = SessionUtil();

  @override
  FutureOr<LocalSessionData> build() async {
    final String? authToken = await _sessionUtil.readSession(_sessionUtil.authKey);
    final String? userToken = await _sessionUtil.readSession(_sessionUtil.userKey);

    return LocalSessionData(authToken: authToken, userToken: userToken);
  }

  set authToken(String? authToken) {
    state = AsyncValue.data(state.requireValue.copyWith(authToken: authToken));
    if (authToken != null) {
      _sessionUtil.writeSession(_sessionUtil.authKey, authToken);
    }
  }

  set userToken(String? userToken) {
    state = AsyncValue.data(state.requireValue.copyWith(userToken: userToken));
    if (userToken != null) {
      _sessionUtil.writeSession(_sessionUtil.userKey, userToken);
    }
  }

  void clearAllSession() async {
    state = AsyncValue.data(LocalSessionData(authToken: null, userToken: null));
    await _sessionUtil.clearSession();
  }
}
