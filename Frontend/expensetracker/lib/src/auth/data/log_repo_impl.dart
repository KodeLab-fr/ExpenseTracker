import 'package:dartz/dartz.dart';
import 'package:expensetracker/shared/cache/storage.dart';
import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:expensetracker/src/auth/domain/models/register.dart';
import 'package:expensetracker/src/auth/domain/repositories/log_repo.dart';
import 'package:expensetracker/shared/errors/failures.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/config.dart';

/// This class is used to implement the log repository by defining the content
class LogRepoImplementation with CacheManager implements LogRepo {
  ///Makes a call to the API to sign in the user
  @override
  Future<Either<Failure, Response>> login(LoginInfo info) async {
    try {
      final response = await GetConnect().post(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/login',
        {},
        headers: info.toMap(),
      );
      if (response.statusCode == 202) {
        return Right(response);
      } else {
        return Left(Failure(response.body ?? 'no_response_server'.tr));
      }
    } catch (error) {
      return Left(Failure(error));
    }
  }

  ///Makes a call to the API to sign up the user
  @override
  Future<Either<Failure, Response>> register(RegisterInfo info) async {
    try {
      final response = await GetConnect().post(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/register',
        info.toMap(),
      );
      return Right(response);
    } catch (error) {
      return Left(Failure(error));
    }
  }

  ///Makes a call to the API to sign in the user using the token stored in cache
  @override
  Future<Either<Failure, Response>> autoLogin(String token) async {
    try {
      final response = await GetConnect().get(
          '${ConfigEnvironments.getCurrentEnvironmentUrl()}/test/test_token',
          query: Map<String, dynamic>.from({'token': token}));
      if (response.body != null) {
        return Right(response);
      } else {
        return Left(Failure('no_response_server'.tr));
      }
    } catch (error) {
      return Left(Failure(error));
    }
  }

  ///Makes a call to the API to send the OTP code to the user
  @override
  Future<Either<Failure, Response>> resendCode() async {
    try {
      final response = await GetConnect().get(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/new_code',
        query: Map<String, dynamic>.from({'token': getToken()}),
      );
      if (response.statusCode == 202) {
        return Right(response);
      } else {
        return Left(Failure(response.body ?? 'no_response_server'.tr));
      }
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Response>> verifyCode(String code) async {
    try {
      final response = await GetConnect().post(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/confirm',
        {},
        query: Map<String, dynamic>.from(
          {
            'number': code,
            'token': getToken(),
          },
        ),
      );
      if (response.statusCode == 202) {
        return Right(response);
      } else {
        return Left(Failure(response.body ?? 'no_response_server'.tr));
      }
    } catch (error) {
      return Left(Failure(error));
    }
  }
}
