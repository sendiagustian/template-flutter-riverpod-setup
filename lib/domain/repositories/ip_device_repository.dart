import 'package:dartz/dartz.dart';

import '../../core/core.dart';

abstract class IpDeviceRepository {
  Future<Either<AppFailure, String>> getIpDevice();
}
