class DeviceInfoModel {
  final String? deviceModel;
  final String? oprationSystem;
  final String? cpu;
  final String? serial;
  final String? ip;
  final int? sdkInt;

  const DeviceInfoModel({
    this.deviceModel,
    this.oprationSystem,
    this.cpu,
    this.serial,
    this.ip,
    this.sdkInt,
  });

  DeviceInfoModel copyWith({
    String? deviceModel,
    String? oprationSystem,
    String? cpu,
    String? serial,
    String? ip,
    int? sdkInt,
  }) {
    return DeviceInfoModel(
      deviceModel: deviceModel ?? this.deviceModel,
      oprationSystem: oprationSystem ?? this.oprationSystem,
      cpu: cpu ?? this.cpu,
      serial: serial ?? this.serial,
      ip: ip ?? this.ip,
      sdkInt: sdkInt ?? this.sdkInt,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'deviceModel': deviceModel,
      'oprationSystem': oprationSystem,
      'cpu': cpu,
      'serial': serial,
      'ip': ip,
      'sdkInt': sdkInt,
    };
  }

  static DeviceInfoModel fromJson(Map<String, Object?> json) {
    return DeviceInfoModel(
      deviceModel: json['deviceModel'] == null ? null : json['deviceModel'] as String,
      oprationSystem: json['oprationSystem'] == null ? null : json['oprationSystem'] as String,
      cpu: json['cpu'] == null ? null : json['cpu'] as String,
      serial: json['serial'] == null ? null : json['serial'] as String,
      ip: json['ip'] == null ? null : json['ip'] as String,
      sdkInt: json['sdkInt'] == null ? null : json['sdkInt'] as int,
    );
  }

  @override
  String toString() {
    return '''DeviceInfoModel(
      deviceModel:$deviceModel,
      oprationSystem:$oprationSystem,
      cpu:$cpu,
      serial:$serial,
      ip:$ip,
      sdkInt:$sdkInt
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceInfoModel &&
        other.runtimeType == runtimeType &&
        other.deviceModel == deviceModel &&
        other.oprationSystem == oprationSystem &&
        other.cpu == cpu &&
        other.serial == serial &&
        other.ip == ip &&
        other.sdkInt == sdkInt;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deviceModel, oprationSystem, cpu, serial, ip, sdkInt);
  }
}
