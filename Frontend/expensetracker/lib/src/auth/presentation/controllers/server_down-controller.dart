import 'package:expensetracker/core/errors/failures.dart';
import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/src/auth/data/log-repo_impl.dart';
import 'package:get/get.dart';

/// Controller for the server down screen
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
        Failure(Adresses.SERV_DOWN_CONT_ERROR_TITLE.tr, 502)
            .showErrorSnackBar();
      } else {
        Get.offAllNamed('/notfound');
      }
    }, (right) {
      obscureScreen = false;
      Get.offAllNamed('/');
    });
  }
}
