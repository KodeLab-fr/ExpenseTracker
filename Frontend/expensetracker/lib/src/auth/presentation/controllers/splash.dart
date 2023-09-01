import 'package:expensetracker/shared/cache/storage.dart';
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
      final response = await _logRepoImplementation.autoLogin(token);
      response.fold((left) {
        Get.toNamed('/noconnexion');
      }, (right) {
        if (right.statusCode == 200) {
          final responseModel = ResponseModel.fromJson(right.body);
          if (responseModel.code == 0) {
            Get.offNamed('/home');
          }
        } else if (right.statusCode == 401) {
          removeToken();
          Get.toNamed('/intro');
        }
      });
    } else {
      Get.offNamed('/intro');
    }
  }
}
