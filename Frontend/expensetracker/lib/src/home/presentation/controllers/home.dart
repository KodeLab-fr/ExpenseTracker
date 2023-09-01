import 'package:expensetracker/src/home/data/home_repo.impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _homeRepoImpl = HomeRepoImpl();

  Future<void> logout() async {
    final result = await _homeRepoImpl.logout();
    result.fold((left) => left.showErrorSnackBar(), (right) {
      Get.offAllNamed('/auth');
    });
  }
}
