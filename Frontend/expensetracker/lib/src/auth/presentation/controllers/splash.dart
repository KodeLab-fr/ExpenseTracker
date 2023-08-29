import 'package:expensetracker/shared/cache/storage.dart';
import 'package:expensetracker/shared/components/errors.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/src/auth/presentation/controllers/network.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with CacheManager {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();

  /// Initializes the navigation
  Future<void> initRoutes() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if (await NetworkController().checkConnection()) {
        checkLoginStatus();
      }
    });
  }

  /// Checks if the user is logged in or not before starting the navigation
  Future<void> checkLoginStatus() async {
    final token = getToken();

    if (token != null) {
      try {
        final response = await _logRepoImplementation.autoLogin(token);
        if (response.statusCode == 200) {
          final responseModel = ResponseModel.fromJson(response.body);
          if (responseModel.code == 0) {
            Get.offNamed('/form');
          }
        } else if (response.statusCode == 401) {
          removeToken();
          Get.toNamed('/intro');
        } else {
          if (response.body == null) {
            Get.toNamed('/notfound');
          } else {
            throw Exception(response.body);
          }
        }
      } catch (error) {
        ErrorManager().showErrorDialog(error);
      }
    } else {
      Get.offNamed('/intro');
    }
  }
}
