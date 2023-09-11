import 'package:get/get.dart';


class AuthController extends GetxController {
  final _obscureScreen = false.obs;
  final _isRegisterFormVisible = true.obs;

  bool get obscureScreen => _obscureScreen.value;

  void toggleObscureScreen() {
    _obscureScreen.value = !_obscureScreen.value;
  }

  bool get isRegisterFormVisible => _isRegisterFormVisible.value;

  void toggleForm() {
    _isRegisterFormVisible.value = !_isRegisterFormVisible.value;
  }
}