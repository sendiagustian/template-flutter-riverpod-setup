import 'package:package_info_plus/package_info_plus.dart';

import '../../presentation/constants/enums/status_enums.dart';
import '../models/app_status_model.dart';

abstract class AppUseCase {
  Future<String> getCurrentVersion();
  Future<String> getLatestVersion();
  Future<bool> checkUpdateVersion();
  Future<MaintenanceStatus> checkMintenanceStatus();
  Future<AppStatusModel> checkAppStatus();
}

class AppUseCaseImpl implements AppUseCase {
  @override
  Future<String> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String current = packageInfo.version;
    return current;
  }

  @override
  Future<String> getLatestVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String current = packageInfo.version;
    return current;

    // TODO CHANGE THIS TO SOURCE AND REPOSITORY GET VERSION
    // final VersionRepository versionRepository = VersionRepositoryImpl();

    // Either<AppFailure, VersionResponse> result = await versionRepository.getVersion();

    // return result.fold((failure) {
    //   throw failure;
    // }, (response) {
    //   return response.version ?? '-';
    // });
  }

  @override
  Future<MaintenanceStatus> checkMintenanceStatus() async {
    return await Future.value(MaintenanceStatus.disabled);

    // TODO CHANGE THIS TO SOURCE AND REPOSITORY CHECK MAINTENANCE
    // final VersionRepository versionRepository = VersionRepositoryImpl();

    // Either<AppFailure, VersionResponse> result = await versionRepository.getVersion();

    // return result.fold((failure) {
    //   throw failure;
    // }, (response) {
    //   return response.status ?? '-';
    // });
  }

  @override
  Future<bool> checkUpdateVersion() async {
    List<int> parseVersion(String version) {
      return version.split('.').map(int.parse).toList();
    }

    String currentVersion = await getCurrentVersion();
    String latestVersion = await getLatestVersion();

    final List<int> current = parseVersion(currentVersion);
    final List<int> latest = parseVersion(latestVersion);

    for (int i = 0; i < current.length; i++) {
      if (current[i] < latest[i]) {
        return true;
      } else if (current[i] > latest[i]) {
        return false;
      }
    }
    return false;
  }

  @override
  Future<AppStatusModel> checkAppStatus() async {
    final String currentVersion = await getCurrentVersion();
    final MaintenanceStatus mintenanceStatus = await checkMintenanceStatus();
    final bool needUpdate = await checkUpdateVersion();

    AppStatusModel appStatus = AppStatusModel(
      version: currentVersion,
      versionStatus: needUpdate ? VersionStatus.older : VersionStatus.latest,
      maintenanceStatus: mintenanceStatus,
    );

    return appStatus;
  }
}
