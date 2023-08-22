import 'package:expensetracker/src/auth/domain/models/sign_in.dart';
import 'package:get/get.dart';

import '../models/sign_up.dart';

abstract class LogRepo {
  Future<Response> signIn(SignInInfo info);

  Future<Response> signUp(SignUpInfo info);

  Future<SignInInfo> signInAuto(String token);
}
