import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
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
  final String keyStorage = 'moodTheme';
  final SessionUtil sessionUtil = SessionUtil();

  @override
  AppState build() {

    AppState initialData = AppState(
      moodTheme: AdaptiveThemeMode.light,
    );

    sessionUtil.readSession(keyStorage).then((theme) {
      if (theme == enumToString(AdaptiveThemeMode.light)) {
        initialData = initialData.copyWith(moodTheme: AdaptiveThemeMode.light);
      } else if (theme == enumToString(AdaptiveThemeMode.dark)) {
        initialData = initialData.copyWith(moodTheme: AdaptiveThemeMode.dark);
      } else if (theme == enumToString(AdaptiveThemeMode.system)) {
        initialData = initialData.copyWith(moodTheme: AdaptiveThemeMode.system);
      } else {
        initialData = initialData.copyWith(moodTheme: AdaptiveThemeMode.light);
      }
    });

    AdaptiveTheme.getThemeMode();

    return initialData;
  }

  void updateMoodTheme(BuildContext context, AdaptiveThemeMode value) {
    state = state.copyWith(moodTheme: value);
    sessionUtil.writeSession(keyStorage, enumToString(state.moodTheme));

    switch (value) {
      case AdaptiveThemeMode.dark:
        AdaptiveTheme.of(context).setDark();
        break;
      case AdaptiveThemeMode.light:
        AdaptiveTheme.of(context).setLight();
        break;
      case AdaptiveThemeMode.system:
        AdaptiveTheme.of(context).setSystem();
        break;
      default:
        AdaptiveTheme.of(context).setLight();
        break;
    }
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
