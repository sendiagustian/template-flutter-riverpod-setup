import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/core.dart';
import '../../domain/repositories/ip_device_repository.dart';
import '../sources/ip_device_source.dart';

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
