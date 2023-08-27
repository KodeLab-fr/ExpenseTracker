// create the binding for the splash screen
import 'package:expensetracker/src/auth/presentation/controllers/network.dart';
import 'package:expensetracker/src/auth/presentation/controllers/splash.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}