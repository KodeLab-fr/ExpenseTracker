import 'package:expensetracker/src/auth/presentation/controllers/code.dart';
import 'package:get/get.dart';

class CodeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeController>(() => CodeController());
  }
}