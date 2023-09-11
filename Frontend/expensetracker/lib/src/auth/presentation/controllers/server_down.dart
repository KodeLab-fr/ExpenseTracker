import 'package:expensetracker/core/errors/failures.dart';
import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:get/get.dart';

class ServerDownController extends GetxController {
  final _logRepoImplementation = LogRepoImplementation();
  final _obscureScreen = false.obs;

  bool get obscureScreen => _obscureScreen.value;
  set obscureScreen(value) => _obscureScreen.value = value;

  /// Shows a loading screen while checking the connection
  void loading() async {
    obscureScreen = true;
    await Future.delayed(const Duration(milliseconds: 500));
    final result = await _logRepoImplementation.checkServer();
    result.fold((left) {
      obscureScreen = false;
      if (left.code == 418) {
        Get.offAllNamed('/noconnexion');
      } else if (left.code == 502) {
        Failure('server_down-title'.tr, 502).showErrorSnackBar();
      } else {
        Get.offAllNamed('/notfound');
      }
    }, (right) {
      obscureScreen = false;
      Get.offAllNamed('/');
    });
  }
}
