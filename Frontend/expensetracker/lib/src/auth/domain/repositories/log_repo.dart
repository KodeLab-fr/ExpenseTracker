import 'package:expensetracker/src/auth/domain/models/sign_in.dart';

abstract class ExpenseRepo {
  Future<SignInInfo> signIn(SignInInfo expense);

  Future<SignInInfo> signUp(SignInInfo expense);

  Future<SignInInfo> signInAuto(String token);
}
