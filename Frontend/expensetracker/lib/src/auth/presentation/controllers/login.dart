import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

import 'package:expensetracker/shared/components/errors.dart';

class LoginController extends GetxController with CacheManager {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
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
    if (validateAndSave()) {
      LoginInfo requestModel = LoginInfo(
        name: nameController.text,
        password: passwordController.text,
      );
      reset();
      try {
        final response = await _logRepoImplementation.login(requestModel);
        if (response.statusCode == 202) {
          final responseModel = ResponseModel.fromJson(response.body);
          saveToken(responseModel.message);
          dispose();
          Get.offAllNamed('/form');
        } else {
          throw Exception(response.body ?? 'Pas de réponse du serveur');
        }
      } catch (error) {
        ErrorManager().showErrorDialog(error);
      }
    }
  }
}
