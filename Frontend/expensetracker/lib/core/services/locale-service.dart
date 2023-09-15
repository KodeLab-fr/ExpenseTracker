import 'package:expensetracker/core/services/cache-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleService extends GetxService {
  var locale = const Locale('en');
  late final CacheService cacheService;

  Future<LocaleService> init() async {
    cacheService = Get.find<CacheService>();
    locale = await cacheService.getLocale();
    return this;
  }

  Locale getLocale() => locale;

  void changeLocale() {
    locale =
        locale == const Locale('fr') ? const Locale('en') : const Locale('fr');
    Get.updateLocale(locale);
    cacheService.saveLocale(locale);
  }
}
