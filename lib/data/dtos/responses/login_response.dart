class LoginResponse {
  final String? username;
  final String? role;
  final String? status;
  final DeviceInfo? deviceInfo;
  const LoginResponse({this.username, this.role, this.status, this.deviceInfo});

  LoginResponse copyWith({String? username, String? role, String? status, DeviceInfo? deviceInfo}) {
    return LoginResponse(
      username: username ?? this.username,
      role: role ?? this.role,
      status: status ?? this.status,
      deviceInfo: deviceInfo ?? this.deviceInfo,
    );
  }

  Map<String, Object?> toJson() {
    return {'username': username, 'role': role, 'status': status, 'deviceInfo': deviceInfo?.toJson()};
  }

  static LoginResponse fromJson(Map<String, Object?> json) {
    return LoginResponse(
      username: json['username'] == null ? null : json['username'] as String,
      role: json['role'] == null ? null : json['role'] as String,
      status: json['status'] == null ? null : json['status'] as String,
      deviceInfo: json['deviceInfo'] == null ? null : DeviceInfo.fromJson(json['deviceInfo'] as Map<String, Object?>),
    );
  }

  @override
  String toString() {
    return '''LoginResponse(
                username:$username,
role:$role,
status:$status,
deviceInfo:${deviceInfo.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is LoginResponse &&
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

class DeviceInfo {
  final String? phoneModel;
  final String? oprationSystem;
  final String? cpu;
  final String? serial;
  final String? ip;
  final int? sdkInt;
  const DeviceInfo({this.phoneModel, this.oprationSystem, this.cpu, this.serial, this.ip, this.sdkInt});
  DeviceInfo copyWith({String? phoneModel, String? oprationSystem, String? cpu, String? serial, String? ip, int? sdkInt}) {
    return DeviceInfo(
        phoneModel: phoneModel ?? this.phoneModel,
        oprationSystem: oprationSystem ?? this.oprationSystem,
        cpu: cpu ?? this.cpu,
        serial: serial ?? this.serial,
        ip: ip ?? this.ip,
        sdkInt: sdkInt ?? this.sdkInt);
  }

  Map<String, Object?> toJson() {
    return {'phoneModel': phoneModel, 'oprationSystem': oprationSystem, 'cpu': cpu, 'serial': serial, 'ip': ip, 'sdkInt': sdkInt};
  }

  static DeviceInfo fromJson(Map<String, Object?> json) {
    return DeviceInfo(
        phoneModel: json['phoneModel'] == null ? null : json['phoneModel'] as String,
        oprationSystem: json['oprationSystem'] == null ? null : json['oprationSystem'] as String,
        cpu: json['cpu'] == null ? null : json['cpu'] as String,
        serial: json['serial'] == null ? null : json['serial'] as String,
        ip: json['ip'] == null ? null : json['ip'] as String,
        sdkInt: json['sdkInt'] == null ? null : json['sdkInt'] as int);
  }

  @override
  String toString() {
    return '''DeviceInfo(
                phoneModel:$phoneModel,
oprationSystem:$oprationSystem,
cpu:$cpu,
serial:$serial,
ip:$ip,
sdkInt:$sdkInt
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceInfo &&
        other.runtimeType == runtimeType &&
        other.phoneModel == phoneModel &&
        other.oprationSystem == oprationSystem &&
        other.cpu == cpu &&
        other.serial == serial &&
        other.ip == ip &&
        other.sdkInt == sdkInt;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, phoneModel, oprationSystem, cpu, serial, ip, sdkInt);
  }
}
