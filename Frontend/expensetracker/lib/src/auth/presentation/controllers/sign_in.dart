import 'package:expensetracker/src/auth/data/log_repo_impl.dart';
import 'package:expensetracker/shared/models/server_response.dart';
import 'package:expensetracker/src/auth/domain/models/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/shared/cache/storage.dart';

class SignInController extends GetxController with CacheManager {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //safety method, getx should automatically dispose controllers when they are not used
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// Clear all the text fields
  void clear() {
    nameController.clear();
    passwordController.clear();
  }

  /// Sign in the user with the informations given in the text fields
  Future<void> login() async {
    SignInInfo requestModel = SignInInfo(
      name: nameController.text,
      password: passwordController.text,
    );

    try {
      final response = await _logRepoImplementation.signIn(requestModel);
      if (response.statusCode == 200) {
        final responseModel = ResponseModel.fromJson(response.body);
        saveToken(responseModel.message);
        dispose();
        Get.toNamed('/form');
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
