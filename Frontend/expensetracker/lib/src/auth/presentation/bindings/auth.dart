import 'package:expensetracker/src/auth/presentation/controllers/login.dart';
import 'package:expensetracker/src/auth/presentation/controllers/register.dart';
import 'package:get/get.dart';

class AuthControllersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
