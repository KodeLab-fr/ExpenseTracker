import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:get/get.dart';

import '../models/register.dart';

abstract class LogRepo {
  Future<Response> login(LoginInfo info);

  Future<Response> register(RegisterInfo info);

  Future<LoginInfo> autoLogin(String token);

  Future<Response> verifyCode(String code);

  Future<Response> resendCode();
}
