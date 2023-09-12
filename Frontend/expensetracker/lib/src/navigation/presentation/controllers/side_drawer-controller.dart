import 'package:expensetracker/core/cache/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideDrawerController extends GetxController with CacheManager {
  Future<void> logout() async {
    removeToken();
    Get.offAllNamed('/auth');
  }

  void changeLangage() {
    Get.updateLocale(Get.locale == const Locale('fr')
        ? const Locale('en')
        : const Locale('fr'));
  }
}
