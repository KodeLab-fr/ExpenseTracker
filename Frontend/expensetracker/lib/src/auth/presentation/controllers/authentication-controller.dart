import 'package:get/get.dart';

/// Controller for the authentication screen
class AuthController extends GetxController {
  final _obscureScreen = false.obs;
  final _isRegisterFormVisible = false.obs;

  bool get obscureScreen => _obscureScreen.value;

  void toggleObscureScreen() {
    _obscureScreen.value = !_obscureScreen.value;
  }

  bool get isRegisterFormVisible => _isRegisterFormVisible.value;

  void toggleForm() {
    _isRegisterFormVisible.value = !_isRegisterFormVisible.value;
  }
}
