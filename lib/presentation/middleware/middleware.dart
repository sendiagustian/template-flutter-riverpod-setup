import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums/status_enums.dart';
import '../riverpod/data_provider/local_storage_data/local_session_data_provider.dart';
import '../screens/app/app_services/app_service.dart';
import '../riverpod/data_provider/app_data/app_data_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/wrapper/wrapper_home_main_screen.dart';
import 'middle_screen/error_screen.dart';
import 'middle_screen/maintenance_screen.dart';
import 'middle_screen/need_update_version_screen.dart';

class Middleware extends ConsumerWidget {
  static const path = '/';
  static const name = 'Middleware';

  const Middleware({super.key});

  static final AppService _appService = AppService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AppData> appData = ref.watch(appDataEventProvider);
    final AsyncValue<LocalSessionDataState> localSessionDataState = ref.watch(localSessionDataEventProvider);

    return appData.when(
      loading: () => const SplashScreen(),
      error: (error, stackTrace) {
        debugPrint(error.toString());
        debugPrint(stackTrace.toString());

        return const ErrorScreen();
      },
      data: (app) {
        if (app.appStatus == null || app.deviceInfo == null) {
          return const ErrorScreen(message: 'No internet connection');
        } else {
          // Check if the app is in maintenance
          if (app.appStatus!.maintenanceStatus == MaintenanceStatus.active) {
            return MaintenanceScreen(
              onPressed: () => _appService.callHelpDesk(context),
            );
          }
          // Check if the app needs an update
          else if (app.appStatus!.versionStatus == VersionStatus.older) {
            return NeedUpdateVersionScreen(
              onPressed: () => _appService.callUpdateApk(context),
            );
          }
          // Check Auth User
          else {
            if (localSessionDataState.value?.authToken == null) {
              return const LoginScreen();
            } else {
              // UserModel user = app.user!;
              return const WrapperHomeMainScreen();
            }
          }
        }
      },
    );
  }
}
