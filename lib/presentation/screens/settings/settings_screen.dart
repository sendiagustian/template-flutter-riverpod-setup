import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../riverpod/state_provider/app_state/app_state_provider.dart';

class SettingsScreen extends ConsumerWidget {
  static const String path = '/settings';
  static const String name = 'Settings Screen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateEvent = ref.watch(appStateEventProvider.notifier);

    return Scaffold(
      appBar: AppBarWidget.gradient(context: context, title: 'Settings'),
      body: ListView(
        padding: AppTheme.geometry.medium,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: AppTheme.radius.large,
            ),
            child: SwitchListTile(
              title: const Text('Dark Mode'),
              value: moodThemeIsDark(context),
              onChanged: (value) {
                AdaptiveThemeMode newMode = value ? AdaptiveThemeMode.dark : AdaptiveThemeMode.light;
                appStateEvent.updateMoodTheme(context, newMode);
              },
            ),
          )
        ],
      ),
    );
  }
}
