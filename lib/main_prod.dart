import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/riverpod/state_provider/app_state/app_state_provider.dart';
import 'routers/router.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Build APK Bundle for Release
// flutter build appbundle --release --no-tree-shake-icons
// flutter build apk -t lib/main_prod.dart --release --no-tree-shake-icons --target-platform android-arm64

AppConfig appConfig = AppConfig(Environment.prod());

Future<void> main() async {
  await appConfig.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final BaseTheme theme = BaseTheme();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateEventProvider);
    final goRouter = ref.watch(routerProvider);

    return AdaptiveTheme(
      initial: appState.moodTheme,
      dark: theme.darkTheme,
      light: theme.lightTheme,
      debugShowFloatingThemeButton: true,
      builder: (theme, darkTheme) {
        final bool isDark = theme.brightness == Brightness.dark || darkTheme.brightness == Brightness.dark;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarContrastEnforced: false,
            systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
            systemNavigationBarDividerColor: isDark ? Colors.grey[850] : Colors.white70,
            systemNavigationBarColor: isDark ? AppTheme.colors.darkPrimary : AppTheme.colors.white,
          ),
          child: MaterialApp.router(
            theme: theme,
            darkTheme: darkTheme,
            routerConfig: goRouter,
            title: 'Flutter Setup',
            locale: const Locale('id'),
            debugShowCheckedModeBanner: false,
            supportedLocales: const [Locale('id')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (_, child) {
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: const [
                  Breakpoint(start: 0, end: 750, name: MOBILE),
                  Breakpoint(start: 751, end: 1024, name: TABLET),
                  Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
