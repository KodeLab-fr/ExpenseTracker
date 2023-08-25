import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/domain/models/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

import 'package:expensetracker/shared/models/errors.dart';

class LoginController extends GetxController with CacheManager {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
  Future<void> signIn() async {
    LoginInfo requestModel = LoginInfo(
      name: nameController.text,
      password: passwordController.text,
    );

    try {
      final response = await _logRepoImplementation.login(requestModel);
      if (response.statusCode == 200) {
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
