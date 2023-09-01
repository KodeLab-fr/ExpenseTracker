import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:expensetracker/shared/errors/failures.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import 'package:expensetracker/src/auth/domain/models/register.dart';

abstract class LogRepo {
  Future<Either<Failure, Response>> login(LoginInfo info);

  Future<Either<Failure, Response>> register(RegisterInfo info);

  Future<Either<Failure, Response>> autoLogin(String token);

  Future<Either<Failure, Response>> verifyCode(String code);

  Future<Either<Failure, Response>> resendCode();
}
