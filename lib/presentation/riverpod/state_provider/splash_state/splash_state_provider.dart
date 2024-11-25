import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_state_provider.g.dart';

class SplashState {
  bool showLoading = false;

  SplashState({
    required this.showLoading,
  });

  SplashState copyWith({
    bool? showLoading,
  }) {
    return SplashState(
      showLoading: showLoading ?? this.showLoading,
    );
  }
}

@riverpod
class SplashStateEvent extends _$SplashStateEvent {
  @override
  SplashState build() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      showLoading = true;
    });

    return SplashState(
      showLoading: false,
    );
  }

  set showLoading(bool value) {
    state = state.copyWith(showLoading: value);
  }
}
