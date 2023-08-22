import 'package:get_storage/get_storage.dart';

final box = GetStorage();

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }
  String? getToken() {
    return box.read(CacheManagerKey.token.toString());
  }
  Future<void> removeToken() async {
    await box.remove(CacheManagerKey.token.toString());
  }

  Future<void> clearCache() async {
    await box.erase();
  }
}

enum CacheManagerKey { token }

