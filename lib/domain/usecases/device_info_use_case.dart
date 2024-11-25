import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../core/core.dart';
import '../../data/repositories/ip_device_repository.dart';
import '../models/device_info_model.dart';

abstract class DeviceInfoUseCase {
  Future<DeviceInfoModel> get();
}

class DeviceInfoUseCaseImpl implements DeviceInfoUseCase {
  @override
  Future<DeviceInfoModel> get() async {
    final IpDeviceRepository ipDeviceRepository = IpDeviceRepositoryImpl();
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    Either<AppFailure, String> result = await ipDeviceRepository.getIpDevice();

    return result.fold((failure) {
      throw failure;
    }, (ip) async {
      DeviceInfoModel deviceInfoResult;

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        deviceInfoResult = DeviceInfoModel(
          phoneModel: '${androidInfo.brand.capitalize()} ${androidInfo.device.toUpperCase()} (${androidInfo.model})',
          oprationSystem: 'Android ${androidInfo.version.release}',
          cpu: androidInfo.board,
          serial: androidInfo.id,
          ip: ip,
          sdkInt: androidInfo.version.sdkInt,
        );
      } else {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

        deviceInfoResult = DeviceInfoModel(
          phoneModel: '${iosInfo.name} ${iosInfo.utsname.machine}',
          oprationSystem: iosInfo.systemName,
          cpu: iosInfo.utsname.machine,
          serial: iosInfo.identifierForVendor ?? '-',
          ip: ip,
          sdkInt: int.parse(iosInfo.systemVersion.split('.').first),
        );
      }

      return deviceInfoResult;
    });
  }
}
