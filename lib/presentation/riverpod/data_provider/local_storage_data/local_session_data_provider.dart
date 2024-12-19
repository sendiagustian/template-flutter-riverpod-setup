import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/session_util.dart';

part 'local_session_data_provider.g.dart';

class LocalSessionDataState {
  final String? authToken;
  final String? userToken;

  LocalSessionDataState({
    this.authToken,
    this.userToken,
  });

  LocalSessionDataState copyWith({
    String? authToken,
    String? userToken,
  }) {
    return LocalSessionDataState(
      authToken: authToken ?? this.authToken,
      userToken: userToken ?? this.userToken,
    );
  }
}

@Riverpod(keepAlive: true)
class LocalSessionDataEvent extends _$LocalSessionDataEvent {
  final SessionUtil _sessionUtil = SessionUtil();

  @override
  FutureOr<LocalSessionDataState> build() async {
    final String? authToken = await _sessionUtil.readSession(_sessionUtil.authKey);
    final String? userToken = await _sessionUtil.readSession(_sessionUtil.userKey);

    return LocalSessionDataState(
      authToken: authToken,
      userToken: userToken,
    );
  }

  set authToken(String? authToken) {
    state = state = AsyncData(state.requireValue.copyWith(authToken: authToken));
    if (authToken != null) {
      _sessionUtil.writeSession(_sessionUtil.authKey, authToken);
    }
  }

  set userToken(String? userToken) {
    state = state = AsyncData(state.requireValue.copyWith(userToken: userToken));
    if (userToken != null) {
      _sessionUtil.writeSession(_sessionUtil.userKey, userToken);
    }
  }

  void clearAllSession() {
    state = AsyncData(state.requireValue.copyWith(
      authToken: null,
      userToken: null,
    ));

    _sessionUtil.clearSession();
  }
}
