import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/presentation/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

import 'package:expensetracker/shared/components/errors.dart';
import 'package:expensetracker/src/auth/domain/models/register.dart';

class RegisterController extends GetxController with CacheManager {
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
      reset();
      try {
        final response = await _logRepoImplementation.register(requestModel);
        if (response.statusCode == 202) {
          final responseModel = ResponseModel.fromJson(response.body);
          if (responseModel.code == 0) {
            saveToken(responseModel.message);
            _authController.toggleObscureScreen();
            Get.toNamed('/otp');
          }
        } else {
          _authController.toggleObscureScreen();
          throw Exception(response.body ?? 'no_response_server'.tr);
        }
      } catch (error) {
        ErrorManager().showErrorDialog(error);
      }
    }
  }
}
