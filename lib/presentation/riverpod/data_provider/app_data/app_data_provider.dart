import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../../domain/models/app_status_model.dart';
import '../../../../domain/models/device_info_model.dart';
import '../../../../domain/models/user_model.dart';
import '../../../../domain/usecases/app_use_case.dart';
import '../../../../domain/usecases/device_info_use_case.dart';
import '../../../constants/enums/status_enums.dart';

part 'app_data_provider.g.dart';

class AppData {
  final AppStatusModel? appStatus;
  final DeviceInfoModel? deviceInfo;
  final UserModel? user;
  final DataStatus status;

  AppData({
    required this.appStatus,
    required this.deviceInfo,
    required this.user,
    required this.status,
  });

  AppData copyWith({
    AppStatusModel? appStatus,
    DeviceInfoModel? deviceInfo,
    UserModel? user,
    DataStatus? status,
  }) {
    return AppData(
      appStatus: appStatus ?? this.appStatus,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}

@Riverpod(keepAlive: true)
class AppDataEvent extends _$AppDataEvent {
  // Util
  final JwtUtil _jwtUtil = JwtUtil();
  final SessionUtil _sessionUtil = SessionUtil();

  // UseCase
  final AppUseCase _appUseCase = AppUseCaseImpl();
  final DeviceInfoUseCase _deviceInfoUseCase = DeviceInfoUseCaseImpl();

  @override
  FutureOr<AppData> build() async {
    late AppData initialData;

    AppStatusModel appStatus = await _appUseCase.checkAppStatus();
    DeviceInfoModel deviceInfo = await _deviceInfoUseCase.get();
    String? token = await getToken();

    // Duration for splash screen
    await Future.delayed(const Duration(seconds: 3)).then((_) async {
      try {
        initialData = AppData(
          appStatus: appStatus,
          deviceInfo: deviceInfo,
          user: token != null ? await tokenToModel(token) : null,
          status: DataStatus.valid,
        );
      } catch (e) {
        initialData = AppData(
          appStatus: null,
          deviceInfo: null,
          user: null,
          status: DataStatus.error,
        );
      }
    });

    return initialData;
  }

  set user(UserModel? value) {
    state = AsyncValue.data(state.requireValue.copyWith(user: value));
  }

  set status(DataStatus value) {
    state = AsyncValue.data(state.requireValue.copyWith(status: value));
  }

  Future<UserModel?> tokenToModel(String token) async {
    Map<String, dynamic>? decodedToken = _jwtUtil.decodeToken(token);

    if (decodedToken != null) {
      UserModel user = UserModel.fromJson(decodedToken);

      return user;
    }

    return null;
  }

  Future<String?> getToken() async {
    return await _sessionUtil.readSession(_sessionUtil.authKey);
  }
}
