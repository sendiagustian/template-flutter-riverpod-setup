import 'device_info_model.dart';

import '../../presentation/constants/enums/status_enums.dart';

class UserModel {
  final String username;
  final String role;
  final UserStatus status;
  final DeviceInfoModel deviceInfo;

  const UserModel({
    required this.username,
    required this.role,
    required this.status,
    required this.deviceInfo,
  });

  static UserModel fromJson(Map<String, Object?> json) {
    return UserModel(
      username: json['username'] as String,
      role: json['role'] as String,
      status: json['status'] == 'active' ? UserStatus.active : UserStatus.disabled,
      deviceInfo: DeviceInfoModel.fromJson(json['deviceInfo'] as Map<String, Object?>),
    );
  }

  UserModel copyWith({String? username, String? role, UserStatus? status, DeviceInfoModel? deviceInfo}) {
    return UserModel(
      username: username ?? this.username,
      role: role ?? this.role,
      status: status ?? this.status,
      deviceInfo: deviceInfo ?? this.deviceInfo,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'username': username,
      'role': role,
      'status': status,
      'deviceInfo': deviceInfo,
    };
  }

  @override
  String toString() {
    return '''UserModel(
      username:$username,
      role:$role,
      status:$status,
      deviceInfo:$deviceInfo,
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        other.runtimeType == runtimeType &&
        other.username == username &&
        other.role == role &&
        other.status == status &&
        other.deviceInfo == deviceInfo;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, username, role, status, deviceInfo);
  }
}
