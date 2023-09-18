import 'package:expensetracker/core/i18n/adresses.dart';
import 'package:expensetracker/core/services/cache-service.dart';
import 'package:expensetracker/core/themes.dart';
import 'package:expensetracker/src/auth/data/log-repo_impl.dart';
import 'package:expensetracker/shared/models/server_response_model.dart';
import 'package:expensetracker/src/auth/presentation/controllers/authentication-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:expensetracker/src/auth/domain/models/register-model.dart';

class RegisterController extends GetxController {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  final AuthController _authController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _obscureText = true.obs;

  bool get obscureText => _obscureText.value;

  void toggle() {
    _obscureText.value = !obscureText;
    update();
  }

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  ///Resets the form to its initial state
  void reset() {
    globalFormKey.currentState!.reset();
    clear();
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
    emailController.clear();
    passwordController.clear();
  }

  /// Sign up the user with the informations given in the text fields
  Future<void> register() async {
    _authController.toggleObscureScreen();
    if (validateAndSave()) {
      RegisterInfo requestModel = RegisterInfo(
        username: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      final response = await _logRepoImplementation.register(requestModel);
      response.fold((left) {
        _authController.toggleObscureScreen();
        if (left.code == 409) {
          Get.snackbar(
            Adresses.REGISTER_CONT_ERROR_TITLE.tr,
            Adresses.REGISTER_CONT_ERROR_CONTENT.tr,
            backgroundColor: Palette.ERROR,
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
        final responseModel = ServerResponseModel.fromJson(right.body);
        if (responseModel.code == 0) {
          Get.find<CacheService>().saveToken(responseModel.message);
          _authController.toggleObscureScreen();
          Get.toNamed('/otp');
        }
      });
    }
  }
}
