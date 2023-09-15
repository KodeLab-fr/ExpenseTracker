import 'package:expensetracker/core/services/Locale-service.dart';
import 'package:expensetracker/core/services/cache-service.dart';
import 'package:expensetracker/core/services/theme-service.dart';
import 'package:get/get.dart';

class SideDrawerController extends GetxController {

  Future<void> logout() async {
    await Get.find<CacheService>().removeToken();
    Get.offAllNamed('/auth');
  }

  void changeLangage() {
    Get.find<LocaleService>().changeLocale();
  }

  void changeTheme() {
    Get.find<ThemeService>().changeTheme();
  }
}
