import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

import '../../../../shared/models/errors.dart';
import '../../domain/models/register.dart';

class RegisterController extends GetxController with CacheManager {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///safety method, getx should automatically dispose controllers when they are not used
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
  Future<void> signUp() async {
    RegisterInfo requestModel = RegisterInfo(
      username: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final response = await _logRepoImplementation.register(requestModel);
      if (response.statusCode == 200) {
        final responseModel = ResponseModel.fromJson(response.body);
        if (responseModel.code == 0) {
          dispose();
          Get.toNamed('/otp');
        }
      } else {
        throw Exception(response.body ?? "Pas de réponse du serveur");
      }
    } catch (error) {
      ErrorManager().showErrorDialog(error);
    }
  }
}
