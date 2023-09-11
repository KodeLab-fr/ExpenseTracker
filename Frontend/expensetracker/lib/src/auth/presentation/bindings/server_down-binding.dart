import 'package:get/get.dart';
import 'package:expensetracker/src/auth/presentation/controllers/server_down-controller.dart';

class ServerDownBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServerDownController>(() => ServerDownController());
  }
}
