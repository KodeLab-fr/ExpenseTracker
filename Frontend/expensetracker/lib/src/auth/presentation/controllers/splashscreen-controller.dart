import 'package:expensetracker/core/services/cache-service.dart';
import 'package:expensetracker/src/auth/data/log-repo_impl.dart';
import 'package:expensetracker/src/auth/presentation/controllers/network-controller.dart';
import 'package:get/get.dart';

/// Controller for the splash screen
class SplashController extends GetxController {
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
    final token = Get.find<CacheService>().getToken();

    if (token != null) {
      final response = await _logRepoImplementation.autoLogin(token);
      response.fold((left) {
        if (left.code == 401) {
          Get.find<CacheService>().removeToken();
          Get.toNamed('/intro');
        } else if (left.code == 502) {
          Get.offAllNamed('/down');
        } else if (left.code == 418) {
          Get.offAllNamed('/noconnexion');
        } else {
          Get.offAllNamed('/notfound');
        }
      }, (right) {
        Get.offNamed('/nav');
      });
    } else {
      Get.offNamed('/intro');
    }
  }
}
