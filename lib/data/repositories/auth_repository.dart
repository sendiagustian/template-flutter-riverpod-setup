import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/shared/app_failure.dart';
import '../dtos/requests/login_request.dart';
import '../dtos/responses/login_response.dart';
import '../sources/auth_source.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, LoginResponse>> login(LoginRequest request);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthSource _source = AuthSourceImpl();

  @override
  Future<Either<AppFailure, LoginResponse>> login(LoginRequest request) async {
    try {
      Map<String, dynamic> response = await _source.login(request);
      return Right(LoginResponse.fromJson(response));
    } on DioException catch (dioError) {
      AppFailure failure = handleDioError(dioError);
      return Left(failure);
    } catch (e) {
      return Left(GeneralFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
