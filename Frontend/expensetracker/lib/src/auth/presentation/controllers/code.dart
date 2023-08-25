import 'package:expensetracker/shared/models/errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/models/server_response.dart';
import '../../data/log_repo_impl.dart';

class CodeController extends GetxController {
  final LogRepoImplementation _logRepoImplementation = LogRepoImplementation();
  TextEditingController code = TextEditingController();

  ///Clear all the text fields
  void reset() {
    code.clear();
  }

  //create a function to send the code again using resendCode method
  Future<void> resendCode() async {
    try {
      final response = await _logRepoImplementation.resendCode();
      if (response.statusCode == 200) {
        final responseModel = ResponseModel.fromJson(response.body);
        if (responseModel.code == 0) {
          Get.snackbar(
            'Code envoyé !',
            'Veuillez vérifier votre boîte mail et vos spams.',
            backgroundColor: const Color(0xFF363f93),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2),
          );
        }
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      ErrorManager().showErrorSnackBar(error);
    }
  }

  ///Verify the code given in the text field
  Future<void> verifyCode() async {
    try {
      final response = await _logRepoImplementation.verifyCode(code.text);
      if (response.statusCode == 200) {
        final responseModel = ResponseModel.fromJson(response.body);
        if (responseModel.code == 0) {
          Get.snackbar(
            'Création de compte réussie !',
            'Vous pourrez désormais utiliser ces identifiants pour vous connecter.',
            backgroundColor: const Color(0xFF363f93),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 3),
          );
          dispose();
          Get.offAllNamed('/form');
        }
      } else {
        throw Exception(response.body ?? "Pas de réponse du serveur");
      }
    } catch (error) {
      reset();
      ErrorManager().showErrorSnackBar(error);
    }
  }
}
