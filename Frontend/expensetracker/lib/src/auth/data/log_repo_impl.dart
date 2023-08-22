import 'package:expensetracker/src/auth/domain/models/sign_in.dart';
import 'package:expensetracker/src/auth/domain/models/sign_up.dart';
import 'package:expensetracker/src/auth/domain/repositories/log_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class LogRepoImplementation implements LogRepo {
  @override
  Future<Response> signIn(SignInInfo requestModel) async {
    final GetConnect connect = GetConnect();
    try {
      final response = await connect.get(
        '${dotenv.env['API_URL']}/auth',
        headers: requestModel.toJson(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<Response> signUp(SignUpInfo info) async {
    final GetConnect connect = GetConnect();
    try {
      final response = await connect.post(
        '${dotenv.env['API_URL']}/user',
        info.toJson(),
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<SignInInfo> signInAuto(String token) async {
    throw UnimplementedError();
  }
}
