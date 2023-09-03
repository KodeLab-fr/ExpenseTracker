import 'package:expensetracker/src/auth/presentation/controllers/network.dart';
import 'package:get/get.dart';

class NetworkControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}