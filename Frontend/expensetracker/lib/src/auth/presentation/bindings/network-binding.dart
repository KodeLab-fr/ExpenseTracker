import 'package:expensetracker/src/auth/presentation/controllers/network-controller.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
