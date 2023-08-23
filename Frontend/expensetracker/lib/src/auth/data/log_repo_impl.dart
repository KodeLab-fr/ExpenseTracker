import 'package:expensetracker/src/auth/domain/models/sign_in.dart';
import 'package:expensetracker/src/auth/domain/models/sign_up.dart';
import 'package:expensetracker/src/auth/domain/repositories/log_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

/// This class is used to implement the log repository by defining the contents of the methods
class LogRepoImplementation implements LogRepo {
  ///Makes a call to the API to sign in the user
  @override
  Future<Response> signIn(SignInInfo requestModel) async {
    final GetConnect connect = GetConnect();
    try {
      final response = await connect.get(
        '${dotenv.env['API_URL']}/auth',
        headers: requestModel.toMap(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to sign up the user
  @override
  Future<Response> signUp(SignUpInfo info) async {
    final GetConnect connect = GetConnect();
    try {
      final response = await connect.post(
        '${dotenv.env['API_URL']}/user',
        info.toMap(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///Makes a call to the API to sign in the user using the token stored in cache
  @override
  Future<SignInInfo> signInAuto(String token) async {
    throw UnimplementedError();
  }
}
