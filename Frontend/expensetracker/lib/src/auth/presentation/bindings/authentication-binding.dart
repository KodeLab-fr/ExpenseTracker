import 'package:expensetracker/src/auth/presentation/controllers/authentication-controller.dart';
import 'package:expensetracker/src/auth/presentation/controllers/login-controller.dart';
import 'package:expensetracker/src/auth/presentation/controllers/register-controller.dart';
import 'package:get/get.dart';

class AuthenticationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
