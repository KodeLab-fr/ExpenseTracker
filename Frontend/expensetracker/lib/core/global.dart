import 'package:expensetracker/core/services/Locale-service.dart';
import 'package:expensetracker/core/services/cache-service.dart';
import 'package:expensetracker/core/services/theme-service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Global {
  static Future init() async {
    if (kDebugMode) {
      print('Initializing services...');
    }
    await Get.putAsync<CacheService>(() => CacheService().init());
    await Get.putAsync<ThemeService>(() => ThemeService().init());
    await Get.putAsync<LocaleService>(() => LocaleService().init());
    await GetStorage.init();
    if (kDebugMode) {
      print('All services started.');
    }
  }
}
