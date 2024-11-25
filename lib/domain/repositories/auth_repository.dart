import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../data/dtos/requests/login_request.dart';
import '../../data/dtos/responses/login_response.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, LoginResponse>> login(LoginRequest request);
}
