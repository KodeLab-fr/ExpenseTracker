import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/domain/models/register.dart';

abstract class LogRepo {
  Future<Response> login(LoginInfo info);

  Future<Response> register(RegisterInfo info);

  Future<Response> autoLogin(String token);

  Future<Response> verifyCode(String code);

  Future<Response> resendCode();
}
