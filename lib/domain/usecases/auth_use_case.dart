import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/dtos/requests/login_request.dart';
import '../../data/dtos/responses/login_response.dart';
import '../models/device_info_model.dart';
import 'app_use_case.dart';
import 'device_info_use_case.dart';

abstract class AuthUseCase {
  Future<String> login(String username, String password);
}

class AuthUseCaseImpl implements AuthUseCase {
  @override
  Future<String> login(String username, String password) async {
    // Utils
    JwtUtil jwtUtil = JwtUtil();

    // Repository
    final AuthRepository authRepository = AuthRepositoryImpl();

    // UseCase
    final DeviceInfoUseCase deviceInfoUseCase = DeviceInfoUseCaseImpl();
    final AppUseCase appUseCase = AppUseCaseImpl();

    final DeviceInfoModel deviceInfo = await deviceInfoUseCase.get();
    final String versionCurrent = await appUseCase.getCurrentVersion();

    LoginRequest request = LoginRequest(
      username: username,
      password: password,
      version: versionCurrent,
      device: deviceInfo.deviceModel!,
      osDevice: deviceInfo.oprationSystem!,
      ip: deviceInfo.ip!,
      serial: deviceInfo.serial!,
    );

    final Either<AppFailure, LoginResponse> result = await authRepository.login(request);

    return result.fold((failure) {
      throw failure;
    }, (response) async {
      return jwtUtil.generateToken(response.toJson());
    });
  }
}
