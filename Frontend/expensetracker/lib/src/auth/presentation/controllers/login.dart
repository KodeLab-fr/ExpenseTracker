import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:expensetracker/src/auth/presentation/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/core/cache/storage.dart';

class LoginController extends GetxController with CacheManager {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  final AuthController _authController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final _obscureText = true.obs;

  bool get obscureText => _obscureText.value;

  ///Switches the visibility of the password in the field
  void toggle() {
    _obscureText.value = !obscureText;
    update();
  }

  ///Resets the form to its initial state
  void reset() {
    globalFormKey.currentState!.reset();
  }

  ///Measures if the form is valid and saves it
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  ///safety method, getx should dispose controllers when they are not used
  @override
  void onClose() {
    super.onClose();
  }

  /// Clear all the text fields
  void clear() {
    nameController.clear();
    passwordController.clear();
  }

  /// Sign in the user with the informations given in the text fields
  Future<void> login() async {
    _authController.toggleObscureScreen();
    if (validateAndSave()) {
      LoginInfo requestModel = LoginInfo(
        name: nameController.text,
        password: passwordController.text,
      );

      final response = await _logRepoImplementation.login(requestModel);
      response.fold((left) {
        _authController.toggleObscureScreen();
        if (left.code == 401) {
          Get.snackbar(
            'login-error_title'.tr,
            'login-error'.tr,
            backgroundColor: const Color(0xFFE57373),
          );
        } else if (left.code == 502) {
          Get.offAllNamed('/down');
        } else if (left.code == 418) {
          Get.offAllNamed('/noconnexion');
        } else {
          Get.offAllNamed('/notfound');
        }
      }, (right) {
        reset();
        final responseModel = ResponseModel.fromJson(right.body);
        saveToken(responseModel.message);
        _authController.toggleObscureScreen();
        dispose();
        Get.offAllNamed('/home');
      });
    }
  }
}
