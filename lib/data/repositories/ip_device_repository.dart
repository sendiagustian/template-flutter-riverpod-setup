import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/shared/app_failure.dart';
import '../sources/ip_device_source.dart';

abstract class IpDeviceRepository {
  Future<Either<AppFailure, String>> getIpDevice();
}

class IpDeviceRepositoryImpl implements IpDeviceRepository {
  final IpDeviceSource _source = IpDeviceSourceImpl();

  @override
  Future<Either<AppFailure, String>> getIpDevice() async {
    try {
      String ipDevice = await _source.getIpDevice();
      return Right(ipDevice);
    } on DioException catch (dioError) {
      AppFailure failure = handleDioError(dioError);
      return Left(failure);
    } catch (e) {
      return Left(GeneralFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
