import 'package:expensetracker/src/navigation/presentation/controllers/navbar_controller.dart';
import 'package:expensetracker/src/navigation/presentation/controllers/side_drawer-controller.dart';
import 'package:get/get.dart';

class NavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
    Get.lazyPut<SideDrawerController>(() => SideDrawerController());
  }
}
