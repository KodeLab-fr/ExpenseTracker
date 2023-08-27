import 'package:expensetracker/shared/cache/storage.dart';
import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:expensetracker/src/auth/domain/models/register.dart';
import 'package:expensetracker/src/auth/domain/repositories/log_repo.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/config.dart';

/// This class is used to implement the log repository by defining the content
class LogRepoImplementation with CacheManager implements LogRepo {
  ///Makes a call to the API to sign in the user
  @override
  Future<Response> login(LoginInfo info) async {
    try {
      final response = await GetConnect().post(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/login',
        {},
        headers: info.toMap(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to sign up the user
  @override
  Future<Response> register(RegisterInfo info) async {
    try {
      final response = await GetConnect().post(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/register',
        info.toMap(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to sign in the user using the token stored in cache
  @override
  Future<Response> autoLogin(String token) async {
    try {
      final response = await GetConnect().get(
          '${ConfigEnvironments.getCurrentEnvironmentUrl()}/test/test_token',
          query: Map<String, dynamic>.from({'token': token}));
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to send the OTP code to the user
  @override
  Future<Response> resendCode() async {
    try {
      final response = await GetConnect().get(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/users/new_code',
        query: Map<String, dynamic>.from({'token': getToken()}),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<Response> verifyCode(String code) async {
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
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }
}
