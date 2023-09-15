import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CacheService extends GetxService {
  late final GetStorage box;

  Future<CacheService> init() async {
    await GetStorage.init();
    box = GetStorage();
    return this;
  }

  Future<void> saveToken(String? token) async {
    await box.write(CacheManagerKey.token.toString(), token);
  }

  String? getToken() {
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    await box.remove(CacheManagerKey.token.toString());
  }

  Future<void> saveTheme(ThemeMode theme) async {
    await box.write(CacheManagerKey.theme.toString(), theme.toString());
  }

  Future<ThemeMode> getTheme() async {
    final content = box.read(CacheManagerKey.theme.toString());
    if (content == null) {
      await saveTheme(ThemeMode.light);
      return ThemeMode.light;
    } else {
      return content == ThemeMode.dark.toString()
          ? ThemeMode.dark
          : ThemeMode.light;
    }
  }

  Future<void> saveLocale(Locale language) async {
    await box.write(CacheManagerKey.language.toString(), language.toString());
  }

  Future<Locale> getLocale() async {
    final content = box.read<String>(CacheManagerKey.language.toString());
    if (content == null) {
      saveLocale(Get.deviceLocale!);
      return Get.deviceLocale!;
    } else {
      return Locale(content);
    }
  }

  Future<void> clearCache() async {
    await box.erase();
  }
}

enum CacheManagerKey { token, theme, language }
