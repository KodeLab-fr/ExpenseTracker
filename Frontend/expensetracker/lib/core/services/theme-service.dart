import 'package:expensetracker/core/services/cache-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  var theme = ThemeMode.light;
  late final CacheService cacheService;

  Future<ThemeService> init() async {
    cacheService = Get.find<CacheService>();
    theme = await cacheService.getTheme();
    return this;
  }

  ThemeMode getTheme() => theme;

  void changeTheme() {
    theme = theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(theme);
    cacheService.saveTheme(theme);
  }
}
