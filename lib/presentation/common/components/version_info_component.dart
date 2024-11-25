import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../riverpod/data_provider/app_data/app_data_provider.dart';

class VersionInfoComponent extends ConsumerWidget {
  final double verticalMargin;

  const VersionInfoComponent({super.key, required this.verticalMargin});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AppData> appData = ref.watch(appDataEventProvider);

    bool isDark = moodThemeIsDark(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Center(
        child: Column(
          children: [
            Image.asset(isDark ? 'assets/images/logo_name_white.png' : 'assets/images/logo_name.png', width: 200),
            AppTheme.spacing.smallY,
            Text(
              'Version ${appData.value?.appStatus?.version}',
              textAlign: TextAlign.center,
              style: AppTheme.typography.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
