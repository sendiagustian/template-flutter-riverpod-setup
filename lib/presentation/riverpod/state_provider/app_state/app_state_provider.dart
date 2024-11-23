import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/enums/status_enums.dart';

part 'app_state_provider.g.dart';

class AppState {
  final AdaptiveThemeMode moodTheme;

  AppState({
    required this.moodTheme,
  });

  AppState copyWith({
    AdaptiveThemeMode? moodTheme,
  }) {
    return AppState(
      moodTheme: moodTheme ?? this.moodTheme,
    );
  }
}

@riverpod
class AppStateEvent extends _$AppStateEvent {
  @override
  AppState build() {
    AppState initialData = AppState(
      moodTheme: AdaptiveThemeMode.light,
    );

    final savedThemeMode = AdaptiveTheme.getThemeMode();

    savedThemeMode.then((theme) {
      initialData = initialData.copyWith(moodTheme: theme);
    });

    return initialData;
  }

  void updateMoodTheme(BuildContext context, AdaptiveThemeMode value) {
    state = state.copyWith(moodTheme: value);
    state.moodTheme == AdaptiveThemeMode.light ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
  }

  DataStatus getStatusByFuture(AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return DataStatus.onLoad;
    } else if (snapshot.hasError) {
      return DataStatus.error;
    } else {
      return DataStatus.valid;
    }
  }
}
