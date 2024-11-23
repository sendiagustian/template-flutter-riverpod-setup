import '../../presentation/constants/enums/status_enums.dart';

class AppStatusModel {
  final String version;
  final VersionStatus versionStatus;
  final MaintenanceStatus maintenanceStatus;

  const AppStatusModel({required this.version, required this.versionStatus, required this.maintenanceStatus});

  AppStatusModel copyWith({String? version, VersionStatus? versionStatus, MaintenanceStatus? maintenanceStatus}) {
    return AppStatusModel(
      version: version ?? this.version,
      versionStatus: versionStatus ?? this.versionStatus,
      maintenanceStatus: maintenanceStatus ?? this.maintenanceStatus,
    );
  }

  Map<String, Object?> toJson() {
    return {'version': version, 'versionStatus': versionStatus, 'maintenanceStatus': maintenanceStatus};
  }

  @override
  String toString() {
    return '''AppStatusModel(
      version:$version,
      versionStatus:$versionStatus,
      maintenanceStatus:$maintenanceStatus
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AppStatusModel &&
        other.runtimeType == runtimeType &&
        other.version == version &&
        other.versionStatus == versionStatus &&
        other.maintenanceStatus == maintenanceStatus;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, version, versionStatus, maintenanceStatus);
  }
}
