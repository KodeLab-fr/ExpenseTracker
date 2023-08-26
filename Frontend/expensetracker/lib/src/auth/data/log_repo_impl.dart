import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:expensetracker/src/auth/domain/models/register.dart';
import 'package:expensetracker/src/auth/domain/repositories/log_repo.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/config.dart';

/// This class is used to implement the log repository by defining the content
class LogRepoImplementation implements LogRepo {
  ///Makes a call to the API to sign in the user
  @override
  Future<Response> login(LoginInfo requestModel) async {
    final GetConnect connect = GetConnect();
    try {
      final response = await connect.get(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/auth',
        headers: requestModel.toMap(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to sign up the user
  @override
  Future<Response> register(RegisterInfo info) async {
    final GetConnect connect = GetConnect();
    try {
      final response = await connect.post(
        '${ConfigEnvironments.getCurrentEnvironmentUrl()}/user',
        info.toMap(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to sign in the user using the token stored in cache
  @override
  Future<LoginInfo> autoLogin(String token) async {
    throw UnimplementedError();
  }

  ///Makes a call to the API to send the OTP code to the user
  @override
  Future<Response> resendCode() async {
    throw UnimplementedError();
  }

  @override
  Future<Response> verifyCode(String code) async {
    throw UnimplementedError();
  }
}
