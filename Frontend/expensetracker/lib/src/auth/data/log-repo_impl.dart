import 'package:dartz/dartz.dart';
import 'package:expensetracker/core/services/cache-service.dart';
import 'package:expensetracker/src/auth/domain/models/login-model.dart';
import 'package:expensetracker/src/auth/domain/models/register-model.dart';
import 'package:expensetracker/src/auth/domain/repositories/log-repo.dart';
import 'package:expensetracker/core/errors/failures.dart';
import 'package:expensetracker/src/auth/presentation/controllers/network-controller.dart';
import 'package:get/get.dart';
import 'package:expensetracker/core/config.dart';

/// This class is used to implement the log repository by defining the content
class LogRepoImplementation implements LogRepo {
  final _networkController = NetworkController();

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
      } else if (response.statusCode == 401) {
        return Left(Failure(response.body, response.statusCode));
      } else if (!await _networkController.isConnected()) {
        return Left(Failure('check_connexion'.tr, 418));
      } else if (response.statusCode == 502 || response.body == null) {
        return Left(Failure('no_response_server'.tr, 502));
      } else {
        return Left(Failure(response.body, 501));
      }
    } catch (error) {
      return Left(Failure(error, 520));
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
      if (response.statusCode == 202) {
        return Right(response);
      } else if (response.statusCode == 409) {
        return Left(Failure(response.body, response.statusCode));
      } else if (!await _networkController.isConnected()) {
        return Left(Failure('check_connexion'.tr, 418));
      } else if (response.statusCode == 502 || response.body == null) {
        return Left(Failure('no_response_server'.tr, 502));
      } else {
        return Left(Failure(response.body, 501));
      }
    } catch (error) {
      return Left(Failure(error, 520));
    }
  }

  ///Makes a call to the API to sign in the user using the token stored in cache
  @override
  Future<Either<Failure, Response>> autoLogin(String token) async {
    try {
      final response = await GetConnect().get(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/test/test_token',
        query: Map<String, dynamic>.from({'token': token}),
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else if (response.statusCode == 401) {
        return Left(Failure(response.body, response.statusCode));
      } else if (!await _networkController.isConnected()) {
        return Left(Failure('check_connexion'.tr, 418));
      } else if (response.statusCode == 502 || response.body == null) {
        return Left(Failure('no_response_server'.tr, 502));
      } else {
        return Left(Failure(response.body, 501));
      }
    } catch (error) {
      return Left(Failure(error, 501));
    }
  }

  ///Makes a call to the API to send the OTP code to the user
  @override
  Future<Either<Failure, Response>> resendCode() async {
    try {
      final response = await GetConnect().get(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/new_code',
        query: Map<String, dynamic>.from(
            {'token': Get.find<CacheService>().getToken()}),
      );
      if (response.statusCode == 202) {
        return Right(response);
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        return Left(Failure(response.body, response.statusCode));
      } else if (!await _networkController.isConnected()) {
        return Left(Failure('check_connexion'.tr, 418));
      } else if (response.statusCode == 502 || response.body == null) {
        return Left(Failure('no_response_server'.tr, 502));
      } else {
        return Left(Failure(response.body, 501));
      }
    } catch (error) {
      return Left(Failure(error, 520));
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
            'token': Get.find<CacheService>().getToken(),
          },
        ),
      );
      if (response.statusCode == 202) {
        return Right(response);
      } else if (response.statusCode == 401 ||
          response.statusCode == 402 ||
          response.statusCode == 404) {
        return Left(Failure(response.body, response.statusCode));
      } else if (!await _networkController.isConnected()) {
        return Left(Failure('check_connexion'.tr, 418));
      } else if (response.statusCode == 502 || response.body == null) {
        return Left(Failure('no_response_server'.tr, 502));
      } else {
        return Left(Failure(response.body, 501));
      }
    } catch (error) {
      return Left(Failure(error, 520));
    }
  }

  @override
  Future<Either<Failure, Response>> checkServer() async {
    try {
      final response = await GetConnect().get(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/',
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else if (!await _networkController.isConnected()) {
        return Left(Failure('check_connexion'.tr, 418));
      } else if (response.statusCode == 502 || response.body == null) {
        return Left(Failure('no_response_server'.tr, 502));
      } else {
        return Left(Failure(response.body, 501));
      }
    } catch (error) {
      return Left(Failure(error, 520));
    }
  }
}
