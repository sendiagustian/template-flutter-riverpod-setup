import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../app/app_components/menu_component.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = moodThemeIsDark(context);

    return ListView(
      padding: AppTheme.geometry.medium,
      children: [
        const Text('Box Sample'),
        AppTheme.spacing.mediumY,
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.colors.darkPrimary : AppTheme.colors.white,
            borderRadius: AppTheme.radius.small,
            boxShadow: AppTheme.boxShadows.box(context),
          ),
        ),
        AppTheme.spacing.largeY,
        const Text('Shimmer Sample'),
        AppTheme.spacing.mediumY,
        Container(
          padding: AppTheme.geometry.small,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.colors.darkPrimary : AppTheme.colors.white,
            borderRadius: AppTheme.radius.small,
            boxShadow: AppTheme.boxShadows.box(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.text(),
              AppTheme.spacing.smallY,
              ShimmerWidget.text(width: 200),
              AppTheme.spacing.smallY,
              ShimmerWidget.text(),
              AppTheme.spacing.smallY,
              ShimmerWidget.text(width: 200),
            ],
          ),
        ),
        AppTheme.spacing.largeY,
        GridView.builder(
          shrinkWrap: true,
          itemCount: ['/test', '/register'].length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final String title = ['/test', '/register'][index].snakeCasetoWordCase();

            return MenuComponent(
              title: title,
              assetIcon: 'assets/icons/icon_app.png',
              onTap: () {
                AppNavigator.push(context, ['/test', '/register'][index]);
              },
            );
          },
        ),
      ],
    );
  }
}
