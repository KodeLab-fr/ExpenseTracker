import 'dart:io';
import 'package:expensetracker/core/errors/failures.dart';
import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final _connectionStatus = false.obs;
  final _obscureScreen = false.obs;

  bool get connectionStatus => _connectionStatus.value;
  set connectionStatus(value) => _connectionStatus.value = value;

  bool get obscureScreen => _obscureScreen.value;
  set obscureScreen(value) => _obscureScreen.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    connectionStatus = await isConnected();
  }

  /// Checks if the device is connected to the internet
  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool> checkConnection() async {
    if (!(await isConnected())) {
      Get.offAllNamed('/noconnexion');
      return false;
    }
    return true;
  }

  /// Shows a loading screen while checking the connection
  void loading() async {
    obscureScreen = true;
    await Future.delayed(const Duration(milliseconds: 500));
    if (await isConnected()) {
      obscureScreen = false;
      Get.offAllNamed('/');
    } else {
      obscureScreen = false;
      Failure(Adresses.NETWORK_CONT_ERROR_TITLE.tr, 418).showErrorSnackBar();
    }
  }
}
