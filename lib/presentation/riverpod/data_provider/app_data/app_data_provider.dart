import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/jwt_utils.dart';
import '../../../../core/utils/session_util.dart';
import '../../../../domain/models/app_status_model.dart';
import '../../../../domain/models/device_info_model.dart';
import '../../../../domain/models/user_model.dart';
import '../../../../domain/usecases/app_use_case.dart';
import '../../../../domain/usecases/device_info_use_case.dart';

part 'app_data_provider.g.dart';

class AppData {
  final AppStatusModel appStatus;
  final DeviceInfoModel deviceInfo;
  final UserModel? user;

  AppData({
    required this.appStatus,
    required this.deviceInfo,
    required this.user,
  });

  AppData copyWith({
    AppStatusModel? appStatus,
    DeviceInfoModel? deviceInfo,
    UserModel? user,
  }) {
    return AppData(
      appStatus: appStatus ?? this.appStatus,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      user: user ?? this.user,
    );
  }
}

@riverpod
class AppDataEvent extends _$AppDataEvent {
  // Util
  final JwtUtil jwtUtil = JwtUtil();
  final SessionUtil sessionUtil = SessionUtil();

  // UseCase
  final AppUseCase appUseCase = AppUseCaseImpl();
  final DeviceInfoUseCase deviceInfoUseCase = DeviceInfoUseCaseImpl();

  @override
  FutureOr<AppData> build() async {
    AppStatusModel appStatus = await appUseCase.checkAppStatus();
    DeviceInfoModel deviceInfo = await deviceInfoUseCase.get();

    String? token = await getToken();

    AppData initialData = AppData(
      appStatus: appStatus,
      deviceInfo: deviceInfo,
      user: token != null ? await tokenToModel(token) : null,
    );

    return initialData;
  }

  set user(UserModel? value) {
    state = AsyncValue.data(state.requireValue.copyWith(user: value));
  }

  Future<UserModel?> tokenToModel(String token) async {
    Map<String, dynamic>? decodedToken = jwtUtil.decodeToken(token);

    if (decodedToken != null) {
      UserModel user = UserModel.fromJson(decodedToken);

      return user;
    }

    return null;
  }

  Future<String?> getToken() async {
    return await sessionUtil.readSession(sessionUtil.authKey);
  }
}
