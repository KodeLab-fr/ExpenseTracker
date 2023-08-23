import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

import '../../domain/models/sign_up.dart';

class SignUpController extends GetxController with CacheManager {
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
    SignUpInfo requestModel = SignUpInfo(
      username: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final response = await _logRepoImplementation.signUp(requestModel);
      if (response.statusCode == 200) {
        final responseModel = ResponseModel.fromJson(response.body);
        if (responseModel.code == 0) {
          await showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Création de compte réussie !"),
                content: const Text(
                    'Veuillez vous connecter avec vos nouveaux identifiants.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
        dispose();
        Get.offAllNamed('/');
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Erreur survenue"),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
